class Theater < ApplicationRecord
  include PgSearch::Model
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  has_one_attached :main_image
  multisearchable against: [:name, :city, :description]
  has_many :screens, dependent: :destroy
  has_many :showtimes, through: :screens
end
