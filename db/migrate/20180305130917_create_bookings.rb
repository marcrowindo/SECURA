class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :quote, foreign_key: true

      t.timestamps
    end
  end
end
