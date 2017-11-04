class DeliveryForm < Rectify::Form
  attribute :name, String
  attribute :min_day, Integer
  attribute :max_day, Integer
  attribute :price, Float

  validates :name, :min_day, :max_day, :price, presence: true
  validates :price, :min_day, :max_day, numericality: { greater_than_or_equal_to: 0 }
end