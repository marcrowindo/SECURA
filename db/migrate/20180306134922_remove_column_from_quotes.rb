class RemoveColumnFromQuotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :quotes, :price
  end
end
