require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:user) }
  end

  # context 'can not be nil ( title, description, rating )' do
  #   [:title, :description, :rating].each do |attr|
  #     it { is_expected.to validate_presence_of(attr) }
  #   end
  # end

  # context 'Check for the number of characters' do
  #   it { should validate_length_of(:title).is_at_most(80) }
  #   it { should validate_length_of(:description).is_at_most(500) }
  # end

  # context 'the rating should greater than 0 and less than or equal 5' do
  #   it 'tha rating should greater tnan 0' do
  #     should validate_numericality_of(:rating).is_greater_than(0)
  #   end

  #   it 'the rating should less than or equal 5' do
  #     should validate_numericality_of(:rating).is_less_than_or_equal_to(5)
  #   end
  # end

  context 'Checking the states' do
    it 'The default state  is in_draft' do
      expect(subject).to have_state(:in_draft)
    end

    it 'Transition to confirmation status' do
      subject.publish
      expect(subject).to have_state(:published)
    end

    it 'Transition to confirmation status' do
      subject.cansel
      expect(subject).to have_state(:canseled)
    end

    it 'State return from published and canceled on pendig' do
      expect(subject).to transition_from(:canseled, :published)
        .to(:in_draft).on_event(:unpublished)
    end
  end
end
