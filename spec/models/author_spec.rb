require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'create an a model author' do
    it 'is valid with valid attributes' do
      expect(create(:author)).to be_valid
    end
    context 'can not be nil ( first_name, last_name )' do
      %i[first_name last_name].each do |attr|
        it { is_expected.to validate_presence_of(attr) }
      end
    end
    context 'must have a check' do
      it { should validate_length_of(:first_name).is_at_most(30) }
      it { should validate_length_of(:last_name).is_at_most(30) }
      it { should validate_length_of(:last_name).is_at_least(2) }
      it { should validate_length_of(:last_name).is_at_least(2) }
   
    end
  end

  describe 'Association' do
    it { is_expected.to have_and_belong_to_many(:books) }
  end

end
