class AddColumnUserIdInReplies < ActiveRecord::Migration[5.0]
  def change
  	add_column :replies, :user_id, :integer
  end
end
