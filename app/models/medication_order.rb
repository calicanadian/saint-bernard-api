class MedicationOrder < ApplicationRecord
  enum medication_route: { PO: 0, IM: 1, SC: 2 }
  enum mass_unit: { mg: 0 }

  has_many :patient_medication_orders

  validates_presence_of :name
  validates_presence_of :dosage
end
