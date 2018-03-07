class AddColumnsToQuotes < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :supplier_name, :string
    add_column :quotes, :supplier_address, :string
    add_column :quotes, :phone_number, :string
    add_column :quotes, :price, :integer
  end
end
