require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:user) }
  end

  context 'can not be nil ( title, description, rating )' do
    [:title, :description, :rating].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end
  context 'Check for the number of characters' do
    it { should validate_length_of(:title).is_at_most(80) }
    it { should validate_length_of(:description).is_at_most(500) }
  end
end
