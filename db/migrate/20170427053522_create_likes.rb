class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.string :likeable_type
      t.integer :likeable_id
      t.string :button
      t.timestamps
    end
  end
end
