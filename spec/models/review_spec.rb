require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:user) }
  end

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
