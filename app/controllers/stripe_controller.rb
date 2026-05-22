class StripeController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def stripe
    payload = request.body.read
    sig_header = request.env["HTTP_STRIPE_SIGNATURE"]
    endpoint_secret = Rails.application.credentials.dig(:stripe, :webhook_secret)
    event = nil

    # 1. FIXED: Changed "try" to "begin"
    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      render json: { error: "Invalid payload" }, status: :bad_request and return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      render json: { error: "Invalid signature" }, status: :bad_request and return
    end

    # 2. Handle the specific event
    case event.type
    when "payment_intent.succeeded"
      payment_intent = event.data.object 
      
      # Extract metadata fields sent from your frontend checkout form
      showtime_id = payment_intent.metadata.showtime_id
      seats_string = payment_intent.metadata.seats # e.g., "A1,A2"
      user_id      = payment_intent.metadata.user_id

      # Check if this is a real transaction with metadata (skips CLI mock tests if metadata is missing)
      if showtime_id.present? && seats_string.present? && user_id.present?
        
        # Split the string "A1,A2" into an array: ["A1", "A2"]
        seats_array = seats_string.split(",")
        
        # Calculate individual seat price (total divided by number of seats)
        # Stripe amounts are in cents, so we convert them to dollars/decimals
        total_price = payment_intent.amount / 100.0
        seat_price  = total_price / seats_array.size
        ticket = nil
        # 🛡️ WRAP EVERYTHING IN A TRANSACTION FOR DATA SAFETY
        ActiveRecord::Base.transaction do
          # Step 1: Create the Master Order Ticket
          ticket = Ticket.create!(
            user_id: user_id,
            showtime_id: showtime_id,
            total_amount: total_price,
            status: "paid",
            stripe_payment_intent_id: payment_intent.id
          )

          # Step 2: Loop through each seat and create the child records
          seats_array.each do |seat_num|
            ticket.ticket_seats.create!(
              seat_number: seat_num.strip,
              price: seat_price
            )
          end
        end

        puts "✅ Database Updated: Ticket and Seats saved cleanly!"
        # TODO: Release Redis Lock here
        begin
          screen = Showtime.find_by(id: showtime_id)&.screen

          if screen
            locked_seat_ids = screen.seats.where(row: seats_array.map { |s| s[0] }, 
                                                 number: seats_array.map { |s| s[1...-1].to_i })
                                          .pluck(:id)


            locked_seat_ids.each do |seat_id|
              lock_key = "lock:showtime:#{showtime_id}:seat:#{seat_id}"
              $redis.del(lock_key)
            end

            puts "🔓 Redis Locks Released successfully for seats: #{seats_string}"
          end
        rescue => e
          puts "⚠️ Warning: Failed to release Redis lock: #{e.message}"
        end


        # TODO: Trigger Mailer here
       if ticket.present?
          TicketMailer.send_ticket(ticket).deliver_later
          puts "📧 Mailer triggered successfully for Ticket ##{ticket.id}!"
        end
        
      else
        puts "💰 CLI Test Payment Received! (No custom metadata provided to write to DB)"
      end
      
    else
      puts "Unhandled event type: #{event.type}"
    end
  end 

end 