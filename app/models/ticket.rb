class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :showtime
  has_many :ticket_seats, dependent: :destroy
end
