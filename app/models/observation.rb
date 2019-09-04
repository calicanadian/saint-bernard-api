class Observation < ApplicationRecord

  has_many :admission_observations

  validates_presence_of :description
end
