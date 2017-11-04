class CreditCardForm < Rectify::Form
  attribute :card_number, String
  attribute :card_name, String
  attribute :year, Integer
  attribute :mount, Integer
  attribute :cvv, String

  validates :card_number, :card_name, :cvv, :mount, :year, presence: true
  validates :card_number, length: { minimum: 11, maximum: 16 }, format: { with: /\A[0-9]+\z/ }
  validates :card_name, length: { minimum: 3, maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :mount, numericality: { greater_than: 0, less_than_or_equal_to: 12 }
  validates :year, numericality: { greater_than: 0, less_than_or_equal_to: 50 }
  validates :cvv, length: { minimum: 3, maximum: 5 }, format: { with: /\A[0-9]+\z/ }
end