require 'rails_helper'

describe DeliveryForm, type: :model do
  context 'can not be nil (name, min_day, max_day, price)' do
    [:name, :min_day, :max_day, :price].each do |var|
      it { is_expected.to validate_presence_of(var) }
    end
  end

  context 'validate_numericality_of (price, min_day, max_day)' do
    [:min_day, :max_day, :price].each do |var|
      it "validate_numericality_of #{var}" do
        should validate_numericality_of(var).is_greater_than_or_equal_to(0)
      end
    end
  end
end