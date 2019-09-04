class CreatePatientDiagnosticProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_diagnostic_procedures do |t|
      t.integer :patient_id
      t.integer :diagnostic_procedure_id

      t.timestamps
    end
  end
end
