class Allergy < ApplicationRecord
  has_many :patient_allergies

  validates_uniqueness_of :description
  validates_presence_of :description
end
