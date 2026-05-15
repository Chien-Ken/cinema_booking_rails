class Screen < ApplicationRecord
  belongs_to :theater
  validates :name, presence: true
  has_many :showtimes, dependent: :destroy
  def name_with_theater
    "#{theater.name} - #{name}"
  end
end
