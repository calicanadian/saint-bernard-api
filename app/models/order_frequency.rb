class OrderFrequency < ApplicationRecord
  enum frequency_unit: { hour: 0 }

  validates_presence_of :value
end
