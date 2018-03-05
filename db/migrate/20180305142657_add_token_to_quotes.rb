class AddTokenToQuotes < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :token, :string
  end
end
