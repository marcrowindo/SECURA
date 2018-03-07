class AddColumnToQuotes < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :paid?, :boolean, default: false
  end
end
