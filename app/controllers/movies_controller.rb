class MoviesController < ApplicationController
  def index
    if params[:filter] == "coming_soon"
      @movies = Movie.coming_soon.paginate(page: params[:page], per_page: 10).order(release_date: :asc)
      @active_tab = "coming_soon"
    else
      @movies = Movie.now_showing.paginate(page: params[:page], per_page: 10).order(release_date: :desc)
      @active_tab = "now_showing"
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def booking
  @movie = Movie.find(params[:id])
  @theaters = Theater.includes(screens: :showtimes).all
end

end
