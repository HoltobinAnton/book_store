class Review < ApplicationRecord
  validates :title, :description, :rating, presence: true
  validates_length_of :title, maximum: 80
  validates_length_of :description, maximum: 500
  validates_numericality_of :rating, greater_than: 0, less_than_or_equal_to: 5
  belongs_to :book
  belongs_to :user
end
