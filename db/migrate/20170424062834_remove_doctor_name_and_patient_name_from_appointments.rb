class RemoveDoctorNameAndPatientNameFromAppointments < ActiveRecord::Migration[5.0]
  def change
     remove_column :appointments, :doctor_name,:patient_name
  end
end
