class CreateTicketSeats < ActiveRecord::Migration[8.1]
  def change
    create_table :ticket_seats do |t|
      t.references :ticket, null: false, foreign_key: true
      t.string :seat_number
      t.decimal :price

      t.timestamps
    end
  end
end
