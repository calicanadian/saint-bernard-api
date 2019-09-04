class CreatePatientAllergies < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_allergies do |t|
      t.integer :patient_id
      t.integer :allergy_id

      t.timestamps
    end
  end
end
