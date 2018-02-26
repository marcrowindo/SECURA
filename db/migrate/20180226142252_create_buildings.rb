class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.integer :access_count
      t.string :object_type
      t.string :vds_certification
      t.string :security_hull
      t.string :emergency_response
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
