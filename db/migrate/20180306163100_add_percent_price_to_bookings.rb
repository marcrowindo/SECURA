class AddPercentPriceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :percent_price, :integer, default: 0
  end
end
