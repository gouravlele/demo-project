class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.string :doctor_name
      t.string :patient_name
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
