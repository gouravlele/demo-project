class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string
    add_column :users, :mobile_no, :string
  end
end
