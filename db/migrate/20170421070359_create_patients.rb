class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :patient_name
      t.string :city
      t.timestamps
    end
  end
end
