class Symptom < ApplicationRecord
  has_many :admission_symptoms

  validates_presence_of :description
end
