class Movie < ApplicationRecord
  include PgSearch::Model
  scope :now_showing, -> { where("release_date <= ?", Date.current) }
  scope :coming_soon, -> {
    where(release_date: (Date.current + 1.day)..(Date.current + 6.months))
  }
  has_one_attached :poster
  validates :title, :director, :genre, presence: true
  multisearchable against: [:title, :genre, :director, :actor, :description]
  has_many :showtimes, dependent: :destroy
  has_many :screens, through: :showtimes
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
