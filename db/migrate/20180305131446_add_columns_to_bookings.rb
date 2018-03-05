class AddColumnsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :date, :date
  end
end
