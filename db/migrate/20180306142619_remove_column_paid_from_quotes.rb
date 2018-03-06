class RemoveColumnPaidFromQuotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :quotes, :paid?
  end
end
