class Material < ApplicationRecord
  validates :title, presence: true, uniqueness: false
  has_and_belongs_to_many :books
end
