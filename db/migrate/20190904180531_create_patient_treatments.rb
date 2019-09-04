class CreatePatientTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_treatments do |t|
      t.integer :patient_id
      t.integer :treatment_id

      t.timestamps
    end
  end
end
