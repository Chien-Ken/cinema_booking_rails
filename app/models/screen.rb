class Screen < ApplicationRecord
  belongs_to :theater
  validates :name, presence: true
  has_many :showtimes, dependent: :destroy
  has_many :seats, dependent: :destroy
  def name_with_theater
    "#{theater.name} - #{name}"
  end
  after_create :generate_seats
  private
  def generate_seats
    ("A".."J").each do |row_letter|
      (1..10).each do |seat_num|
        seats.create(row: row_letter, number: seat_num)
      end
    end
  end
end
