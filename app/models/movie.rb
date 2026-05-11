class Movie < ApplicationRecord
  scope :now_showing, -> { where("release_date <= ?", Date.current) }
  scope :coming_soon, -> {
    where(release_date: (Date.current + 1.day)..(Date.current + 6.months))
  }
end
