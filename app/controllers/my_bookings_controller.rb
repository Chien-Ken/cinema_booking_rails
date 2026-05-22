class MyBookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tickets = current_user.tickets
                           .where(status: "paid")
                           .includes(showtime: [:movie, { screen: :theater }])
                           .order(created_at: :desc)
  end
  
  def cancel
  @ticket = current_user.tickets.find(params[:id])

  if @ticket.status != "paid" || @ticket.showtime.start_time < 60.minutes.from_now
    redirect_to my_bookings_path, alert: "Yêu cầu không hợp lệ hoặc đã hết thời gian được phép hủy vé!" and return
  end

  ActiveRecord::Base.transaction do
    @ticket.update!(status: "canceled")

    @ticket.ticket_seats.destroy_all

    Stripe::Refund.create({
      payment_intent: @ticket.stripe_payment_intent_id
    })
  end

  TicketMailer.cancel_ticket(@ticket).deliver_later
  puts "📧 Cancel Mailer triggered successfully for Ticket ##{@ticket.id}!"

  redirect_to my_bookings_path, notice: "Hủy vé thành công! Tiền đang được Stripe hoàn lại vào tài khoản của bạn."

  rescue Stripe::StripeError => e
    redirect_to my_bookings_path, alert: "Hủy vé thất bại do lỗi cổng thanh toán: #{e.message}"
  end

end
