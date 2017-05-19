class AddColumnsInImages < ActiveRecord::Migration[5.0]
  def change
  	add_column :images, :post_id, :integer
  	add_column :images, :comment_id, :integer
  	add_column :images, :reply_id, :integer
  end
end
