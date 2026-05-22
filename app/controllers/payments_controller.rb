class PaymentsController < ApplicationController
  def new
    # 1. Grab data from the URL params
    @seat_ids = params[:seat_ids] || []
    @showtime = Showtime.find_by(id: params[:showtime_id])
    
    # Safety Gate: Redirect if data is missing
    if @showtime.nil? || @seat_ids.empty?
      redirect_to movies_path, alert: "Invalid selection. Please try again." and return
    end

    @movie = @showtime.movie
    @total_price = @seat_ids.count * @movie.price

    # 3. ATOMIC LOCKING: Try to lock all selected seats
    all_locked = @seat_ids.all? do |seat_id|
      lock_key = "lock:showtime:#{@showtime.id}:seat:#{seat_id}"
      $redis.set(lock_key, "locked", nx: true, ex: 600) # Lock expires in 10 minutes
    end

    unless all_locked
      # Failure: Someone else got a lock in the last few milliseconds
      redirect_to movie_path(@showtime.movie), 
                  alert: "Sorry, one of those seats was just grabbed by someone else!" and return
    end

    # 3️⃣ Tạo PaymentIntent
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

    begin
      @intent = Stripe::PaymentIntent.create(
        amount: (@total_price * 100).to_i, # Stripe dùng cent
        currency: "usd",
        automatic_payment_methods: { enabled: true },
        metadata: {
          showtime_id: @showtime.id,
          seats: @seat_ids.join(","),      # 🌟 Changed key name to match your webhook controller expectance ('seats')
          user_id: current_user.id        # 🌟 ADDED: Your webhook requires this to save!
        }
      )
    rescue Stripe::StripeError => e
      # 🚨 If Stripe fails, gracefully unlock the seats in Redis right away!
      @seat_ids.each do |seat_id|
        $redis.del("lock:showtime:#{@showtime.id}:seat:#{seat_id}")
      end
      
      redirect_to movie_path(@showtime.movie), alert: "Stripe Payment Error: #{e.message}"
    end
  end

  def create; end
  def success; end

 def check_status
  ticket = Ticket.find_by(stripe_payment_intent_id: params[:payment_intent_id])

  if ticket.present? && ticket.status == "paid"
    render json: { status: "completed" }
  else
    render json: { status: "processing" }
  end
end

end