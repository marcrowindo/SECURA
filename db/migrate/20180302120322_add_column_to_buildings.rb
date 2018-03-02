class AddColumnToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :vds_multiple, :integer
  end
end
