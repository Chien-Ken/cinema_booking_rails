module Admin
class Admin::DashboardController < Admin::ApplicationController
  def index
    @theater_count = Theater.count
  end
end
end


