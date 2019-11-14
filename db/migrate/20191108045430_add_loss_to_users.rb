class AddLossToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :loss, :integer
  end
end
