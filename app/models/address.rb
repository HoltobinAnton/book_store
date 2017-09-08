class Address < ApplicationRecord
  validates :address, :city, :phone, :zip, presence: true

  belongs_to :user
  belongs_to :country
end
 