require 'rails_helper'

RSpec.describe Material, type: :model do
  subject { create(:material) }

  context 'Validation' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    context 'validations' do
      it { is_expected.to validate_presence_of(:title) }
     # it { is_expected.to validate_uniqueness_of(:title) }
    end
  end
end
