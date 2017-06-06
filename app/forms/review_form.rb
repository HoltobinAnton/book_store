class ReviewForm < Rectify::Form
  
  attribute :title, String
  attribute :description, String
  attribute :rating, Float
  attribute :book_id, Integer
  attribute :user_id, Integer

  validates :book_id, :user_id, presence: true
  validates :title, :description, :rating, presence: true
  validates_length_of :title, maximum: 80
  validates_length_of :description, maximum: 500
  validates_numericality_of :rating, greater_than: 0, less_than_or_equal_to: 5
  
end