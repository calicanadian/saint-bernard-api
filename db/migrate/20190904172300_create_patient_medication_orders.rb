class CreatePatientMedicationOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_medication_orders do |t|
      t.integer :patient_id
      t.integer :medication_order_id

      t.timestamps
    end
  end
end
