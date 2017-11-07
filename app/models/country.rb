class Country < ApplicationRecord
  validates :name, presence: true
  validates_length_of :name, maximum: 50
end
