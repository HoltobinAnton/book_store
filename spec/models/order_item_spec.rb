require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:book) }
  end

  describe 'checked attributes' do
    %i(quantity unit_price total_price).each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end
end
