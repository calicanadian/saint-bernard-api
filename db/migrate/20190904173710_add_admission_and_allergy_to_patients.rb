class AddAdmissionAndAllergyToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :admission_id, :integer
    add_column :patients, :allergy_id, :integer
  end
end
