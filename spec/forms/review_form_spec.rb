require "rails_helper"

describe ReviewForm, type: :model do
  context 'can not be nil ( title, description, rating )' do
    [:title, :description, :rating].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end

  context 'Check for the number of characters' do
    it { should validate_length_of(:title).is_at_most(80) }
    it { should validate_length_of(:description).is_at_most(500) }
  end

  context 'the rating should greater than 0 and less than or equal 5' do
    it 'tha rating should greater tnan 0' do
      should validate_numericality_of(:rating).is_greater_than(0)
    end

    it 'the rating should less than or equal 5' do
      should validate_numericality_of(:rating).is_less_than_or_equal_to(5)
    end
  end

end
