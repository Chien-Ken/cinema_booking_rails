class Admin::ScreensController < Admin::ApplicationController
  before_action :set_screen, only: [:edit, :update, :destroy]
  def index
    # Eager load theaters to show names efficiently in the table
    @screens = Screen.includes(:theater).order("theaters.name ASC")
  end

  def new
    @screen = Screen.new
  end

  def create
    @screen = Screen.new(screen_params)
    if @screen.save
      redirect_to admin_screens_path, notice: "Screen created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @screen.update(screen_params)
      redirect_to admin_screens_path, notice: "Screen updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @screen.destroy
    redirect_to admin_screens_path, notice: "Screen deleted successfully."
  end

  private
  def set_screen
    @screen = Screen.find(params[:id])
  end

  def screen_params
    params.require(:screen).permit(:name, :theater_id)
  end
end
