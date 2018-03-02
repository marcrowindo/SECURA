class AddColumnToFloors < ActiveRecord::Migration[5.1]
  def change
    add_column :floors, :windows_and_doors_sensor, :integer
  end
end
