class AddRequestToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :request, foreign_key: true
  end
end
