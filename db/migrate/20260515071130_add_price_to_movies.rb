class AddPriceToMovies < ActiveRecord::Migration[8.1]
  def change
    add_column :movies, :price, :decimal, precision: 8, scale: 2, default: 10.00
  end
end
