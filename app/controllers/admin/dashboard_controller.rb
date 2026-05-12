module Admin
class Admin::DashboardController < Admin::ApplicationController
  def index
    @theater_count = Theater.count
    @movie_count = Movie.count
  end
end
end

