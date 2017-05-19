class RemoveColumnNameFromReplies < ActiveRecord::Migration[5.0]
  def change
  	remove_column :replies, :reply
  end
end
