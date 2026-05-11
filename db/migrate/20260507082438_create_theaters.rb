class CreateTheaters < ActiveRecord::Migration[8.1]
  def change
    create_table :theaters do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :phone
      t.text :description
      t.string :image_url
      t.string :opening_time
      t.string :closing_time

      t.timestamps
    end
  end
end
