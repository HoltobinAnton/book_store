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
end
