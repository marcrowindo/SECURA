class RemoveColumnFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :paid?, :boolean, default: false
  end
end
