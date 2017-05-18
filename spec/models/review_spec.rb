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

  context 'the title should be validated on  regulars' do
    it 'should be validated on  a-z, A-Z, 0-9,' do
      should allow_value('Test145').for(:title)
    end
  end

  context 'the tite should not be validated on regulars' do
    ['Test 14',
     '!@fawfw',
     ' 1f',
     'test-test',
     '{fawfwfw}',
     ' !#$%&*+-/=?^_`{|}~.'].each do |str|
      it 'the tite should not be validated on regulars' do
        should_not allow_value(str).for(:title)
      end
    end
  end 
end
