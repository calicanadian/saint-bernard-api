class Treatment < ApplicationRecord
  has_many :patient_treatments

  validates_presence_of :description
end
