class CreatePatientDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_diagnoses do |t|
      t.integer :patient_id
      t.integer :diagnosis_id

      t.timestamps
    end
  end
end
