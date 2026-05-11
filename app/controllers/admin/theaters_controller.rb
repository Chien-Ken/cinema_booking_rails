module Admin
class Admin::TheatersController < Admin::ApplicationController
  def index
    @theaters = Theater.paginate(page: params[:page], per_page: 10)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @theater = Theater.find(params[:id])
    if @theater.destroy
      flash[:notice] = "Theater was successfully deleted."
    else
      flash[:alert] = "Failed to delete theater."
    end

    redirect_to admin_theaters_path
  end
end
end
