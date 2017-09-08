class Address < ApplicationRecord
  validates :address, :city, :phone, :zip, presence: true
  validates_length_of :address, :city, maximum: 50
  validates_length_of :phone, maximum: 15
  validates :phone, format: { with: /\d[0-9]\)*\z/ }
  validates_length_of :zip, maximum: 10
  validates :zip, format: { with: /\d[0-9]\)*\z/ }

  belongs_to :user
  belongs_to :country
end