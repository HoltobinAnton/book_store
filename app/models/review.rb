class Review < ApplicationRecord
  validates :title, :description, :rating, presence: true

  belongs_to :book
  belongs_to :user
end
