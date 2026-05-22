class CreateTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :tickets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :showtime, null: false, foreign_key: true
      t.decimal :total_amount
      t.string :status
      t.string :stripe_payment_intent_id

      t.timestamps
    end
  end
end
