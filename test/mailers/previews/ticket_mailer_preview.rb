# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/ticket_mailer/send_ticket
  def send_ticket
    TicketMailer.send_ticket
  end
end
