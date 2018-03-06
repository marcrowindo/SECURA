class AddStripeColumnsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_monetize :bookings, :amount, currency: { present: false }
    add_column :bookings, :payment, :jsonb
  end
end
