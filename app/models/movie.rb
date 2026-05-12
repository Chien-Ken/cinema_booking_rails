class Movie < ApplicationRecord
  include PgSearch::Model
  scope :now_showing, -> { where("release_date <= ?", Date.current) }
  scope :coming_soon, -> {
    where(release_date: (Date.current + 1.day)..(Date.current + 6.months))
  }
  has_one_attached :poster
  validates :title, :director, :genre, presence: true
  multisearchable against: [:title, :genre, :director, :actor, :description]
end
