class StripeController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def stripe
    payload = request.body.read
    sig_header = request.env["HTTP_STRIPE_SIGNATURE"]
    
    
    endpoint_secret = ENV['STRIPE_WEBHOOK_SECRET'] || Rails.application.credentials.dig(:stripe, :webhook_secret)
    event = nil

    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue JSON::ParserError => e
      render json: { error: "Invalid payload" }, status: :bad_request and return
    rescue Stripe::SignatureVerificationError => e
      render json: { error: "Invalid signature" }, status: :bad_request and return
    end

    case event.type
    when "payment_intent.succeeded"
      payment_intent = event.data.object 
      
      showtime_id  = payment_intent.metadata.showtime_id
      seats_string = payment_intent.metadata.seats
      user_id      = payment_intent.metadata.user_id

      if showtime_id.present? && seats_string.present? && user_id.present?
        seats_array = seats_string.split(",")
        total_price = payment_intent.amount / 100.0
        seat_price  = total_price / seats_array.size

        # 🛡️ WRAP TRONG TRANSACTION VÀ CHỈ GỬI MAIL KHI ĐÃ COMMIT THÀNH CÔNG
        ActiveRecord::Base.transaction do
          ticket = Ticket.create!(
            user_id: user_id,
            showtime_id: showtime_id,
            total_amount: total_price,
            status: "paid",
            stripe_payment_intent_id: payment_intent.id
          )

          seats_array.each do |seat_num|
            ticket.ticket_seats.create!(
              seat_number: seat_num.strip,
              price: seat_price
            )
          end


         ActiveRecord::Base.connection.current_transaction.after_commit do
          TicketMailer.send_ticket(ticket).deliver_later
         end
        end


        begin
          screen = Showtime.find_by(id: showtime_id)&.screen
          if screen
            locked_seat_ids = screen.seats.where(
              row: seats_array.map { |s| s[0] }, 
              number: seats_array.map { |s| s[1...-1].to_i }
            ).pluck(:id)

            locked_seat_ids.each do |seat_id|
              lock_key = "lock:showtime:#{showtime_id}:seat:#{seat_id}"
              $redis.del(lock_key)
            end
          end
        rescue => e
          Rails.logger.warn "⚠️ Warning: Failed to release Redis lock: #{e.message}"
        end
        
      else
        Rails.logger.info "💰 CLI Test Payment Received! (No custom metadata)"
      end

    when "charge.refunded"
      refund_object = event.data.object
      # Xử lý refund nếu cần ở đây...

    else
      Rails.logger.info "Unhandled event type: #{event.type}"
    end

    render json: { message: "success" }, status: :ok
  end 
end