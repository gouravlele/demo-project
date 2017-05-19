class AddColumnBodyForReplies < ActiveRecord::Migration[5.0]
  def change
  	add_column :replies, :body, :string
  end
end
