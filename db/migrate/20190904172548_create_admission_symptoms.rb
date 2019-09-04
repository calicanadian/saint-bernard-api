class CreateAdmissionSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :admission_symptoms do |t|
      t.integer :admission_id
      t.integer :symptom_id

      t.timestamps
    end
  end
end
