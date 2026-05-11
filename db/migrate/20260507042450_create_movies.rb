class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :duration_minutes
      t.date :release_date
      t.decimal :rating, precision: 3, scale: 1, default: 0.0
      t.string :director
      t.string :actor
      t.string :genre
      t.string :poster_url

      t.timestamps
    end
  end
end
