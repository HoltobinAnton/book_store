class Review < ApplicationRecord
  validates :title, :description, :rating, presence: true
  validates_length_of :title, maximum: 80
  validates_length_of :description, maximum: 500
  belongs_to :book
  belongs_to :user
end
