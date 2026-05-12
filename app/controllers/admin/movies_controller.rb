class Admin::MoviesController < Admin::ApplicationController
  before_action :set_movie, only: [:edit, :update, :destroy]
  def index
    @movies = Movie.all.with_attached_poster.paginate(page: params[:page], per_page: 10)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movies_path, notice: "Movie was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to admin_movies_path, notice: "Movie was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to admin_movies_path, notice: "Movie deleted."
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(
      :title, :description, :duration_minutes, 
      :release_date, :rating, :director, 
      :actor, :genre, :poster
    )
  end
end
