class RemovePosterUrlFromMovies < ActiveRecord::Migration[8.1]
  def change
    remove_column :movies, :poster_url, :string
  end
end
