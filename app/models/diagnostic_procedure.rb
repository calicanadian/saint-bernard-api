class DiagnosticProcedure < ApplicationRecord
  has_many :patient_diagnostic_procedures

  validates_presence_of :description
end
