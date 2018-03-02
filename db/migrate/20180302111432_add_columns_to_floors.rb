class AddColumnsToFloors < ActiveRecord::Migration[5.1]
  def change
    add_column :floors, :motion_detector_min, :integer
    add_column :floors, :motion_detector_max, :integer
  end
end
