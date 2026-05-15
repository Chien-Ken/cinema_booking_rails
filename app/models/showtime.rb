class Showtime < ApplicationRecord
  belongs_to :movie
  belongs_to :screen
  validates :start_time, presence: true
end
