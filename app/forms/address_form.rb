class AddressForm < Rectify::Form
  attribute :address, String
  attribute :city, String
  attribute :phone, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :zip, Integer
  attribute :country_id, Integer
  
  validates :address, :city, :phone, :zip, presence: true
  validates :first_name, :last_name, presence: true
  validates_length_of :address, :city, :first_name, :last_name, maximum: 50
  validates :phone, format: { with: /\d[0-9]\)*\z/ }
  validates_length_of :zip, maximum: 10
  validates :zip, format: { with: /\d[0-9]\)*\z/ }
end