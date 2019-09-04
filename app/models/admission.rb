class Admission < ApplicationRecord

  has_many :admission_diagnoses
  has_many :admission_observations
  has_many :admission_symptoms
end
