class Review < ApplicationRecord
  include AASM

  aasm :column => 'state' do
  end

  belongs_to :book
  belongs_to :user

  
end
