require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:book) }
  end

  describe 'validations' do
    it 'validate_numericality_of :quantity' do
      should validate_numericality_of(:quantity).is_greater_than(0)
      should validate_numericality_of(:quantity).is_less_than_or_equal_to(99)
    end
  end
end
