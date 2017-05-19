class AddColoumnBodyForComment < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :body, :string
  end
end
