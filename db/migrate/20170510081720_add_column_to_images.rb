class AddColumnToImages < ActiveRecord::Migration[5.0]
 def self.up
    change_table :images do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :images, :avatar
  end
end
