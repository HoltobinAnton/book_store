require 'rails_helper'

RSpec.describe Material, type: :model do
  describe 'Validation' do
    it 'is valid with valid attributes' do
      expect(create(:material)).to be_valid
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_uniqueness_of(:title) }
    end
  end
end
