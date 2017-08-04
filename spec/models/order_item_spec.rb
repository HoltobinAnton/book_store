require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:book) }
  end

  
end
