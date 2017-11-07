class Review < ApplicationRecord
  include AASM

  belongs_to :book
  belongs_to :user

  aasm column: 'state' do
    state :in_draft, initial: true
    state :published
    state :canseled

    event :publish do
      transitions from: :in_draft, to: :published
    end

    event :cansel do
      transitions from: [:in_draft, :published], to: :canseled
    end

    event :unpublished do
      transitions from: [:published, :canseled], to: :in_draft
    end
  end
end
