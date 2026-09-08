module Admin
class Admin::TheatersController < Admin::ApplicationController
  before_action :set_theater, only: [:edit, :update, :destroy]
  def index
    @theaters = Theater.paginate(page: params[:page], per_page: 10)
  end

  def new
   @theater = Theater.new
  end

  def create
     @theater = Theater.new(theater_params)
    if @theater.save
      redirect_to admin_theaters_path, notice: "Theater was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @theater.update(theater_params)
      redirect_to admin_theaters_path, notice: "Theater was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @theater.destroy
      flash[:notice] = "Theater was successfully deleted."
    else
      flash[:alert] = "Failed to delete theater."
    end

    redirect_to admin_theaters_path
  end

  private
  def theater_params
    params.require(:theater).permit(
      :name, :address, :city, :phone, :email,
      :opening_time, :closing_time, :description,
      :main_image
    )
  end

  def set_theater
    @theater = Theater.find(params[:id])
  end
end
end
