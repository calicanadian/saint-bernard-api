class CreateAdmissionObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :admission_observations do |t|
      t.integer :admission_id
      t.integer :observation_id

      t.timestamps
    end
  end
end
