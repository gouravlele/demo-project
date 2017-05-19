class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :doctor_name
      t.string :speciality
      t.timestamps
    end
  end
end
