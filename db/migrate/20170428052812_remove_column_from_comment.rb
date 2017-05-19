class RemoveColumnFromComment < ActiveRecord::Migration[5.0]
  def change
  	remove_column :comments, :comment
  end
end
