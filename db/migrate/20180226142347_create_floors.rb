class CreateFloors < ActiveRecord::Migration[5.1]
  def change
    create_table :floors do |t|
      t.string :floor_type
      t.integer :windows
      t.integer :rooms
      t.integer :doors
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
