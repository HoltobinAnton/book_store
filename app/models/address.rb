class Address < ApplicationRecord
  validates :city, :phone, :zip, presence: true

  belongs_to :user
  belongs_to :order
  has_many :countries
end
 