class Review < ApplicationRecord
  validates :title, :description, :rating, presence: true
  validates_format_of :title, with: /\A[a-z\d]*\Z/i
  validates_length_of :title, maximum: 80

  belongs_to :book
  belongs_to :user
end
