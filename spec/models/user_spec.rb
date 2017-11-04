require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to have_many(:orders) }
    it { is_expected.to have_many(:addresses) }
  end
  describe 'validations' do
    it { should validate_length_of(:first_name).is_at_most(50) }
    it { should validate_length_of(:last_name).is_at_most(50) }
  end
end
