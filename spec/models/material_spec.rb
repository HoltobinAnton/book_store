require 'rails_helper'

RSpec.describe Material, type: :model do
  subject { create(:material) }

  context 'Validation' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it { is_expected.to validate_presence_of(:title) }
  end

  context 'associations' do
    it { is_expected.to have_and_belong_to_many(:books) }
  end
end
