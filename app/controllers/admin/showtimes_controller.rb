class Admin::ShowtimesController < Admin::ApplicationController
  before_action :set_showtime, only: [:edit, :update, :destroy]
  def index
    @showtimes = Showtime.includes(:movie, screen: :theater).order(start_time: :asc)
  end

  def new
    @showtime = Showtime.new
    load_form_data
  end

  def create
    @showtime = Showtime.new(showtime_params)
    if @showtime.save
      redirect_to admin_showtimes_path, notice: 'Showtime was successfully created.'
    else
      load_form_data
      render :new
    end
  end

  def edit
    load_form_data
  end

  def update
    if @showtime.update(showtime_params)
      redirect_to admin_showtimes_path, notice: 'Showtime was successfully updated.'
    else
      load_form_data
      render :edit
    end
  end

  def destroy
    @showtime.destroy
    redirect_to admin_showtimes_path, notice: 'Showtime was successfully deleted.'
  end
  private

  def set_showtime
    @showtime = Showtime.find(params[:id])
  end

  def load_form_data
    @movies = Movie.all
    @screens = Screen.includes(:theater).all
  end

  def showtime_params
    params.require(:showtime).permit(:movie_id, :screen_id, :start_time)
  end

end
