class TicketMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.send_ticket.subject
  #
  default from: "no-reply@cinemabooking.com"
  def send_ticket(ticket)
    @ticket = ticket
    @user = @ticket.user
    @showtime = @ticket.showtime
    @movie = @showtime.movie
    mail(to: @user.email, subject: "🍿 Xác nhận đặt vé thành công: #{@movie.title}")
  end

  def cancel_ticket(ticket)
    @ticket = ticket
    @user = ticket.user
    mail(to: @user.email, subject: "❌ Thông báo hủy vé và hoàn tiền ##{@ticket.id}")
  end
end
