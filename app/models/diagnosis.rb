class Diagnosis < ApplicationRecord
  has_many :admission_diagnoses
  has_many :patient_diagnoses
  has_many :patient_chronic_conditions

  validates_uniqueness_of :code
  validates_presence_of :coding_system
  validates_presence_of :code
  validates_presence_of :description
end
