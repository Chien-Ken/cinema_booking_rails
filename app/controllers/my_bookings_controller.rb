class MyBookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tickets = current_user.tickets
                           .where(status: "paid")
                           .includes(showtime: [:movie, { screen: :theater }])
                           .order(created_at: :desc)
  end
end
