class Showtime < ApplicationRecord
  belongs_to :movie
  belongs_to :screen
  validates :start_time, presence: true
  has_many :reservations
  def booked_seat_ids
    reservations.pluck(:seat_id)
  end
end
