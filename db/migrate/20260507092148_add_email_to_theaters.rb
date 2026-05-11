class AddEmailToTheaters < ActiveRecord::Migration[8.1]
  def change
    add_column :theaters, :email, :string
  end
end
