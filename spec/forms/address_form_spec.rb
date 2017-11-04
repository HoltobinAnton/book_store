require 'rails_helper'

describe AddressForm, type: :model do
  context 'can not be nil (address, city, phone, zip)' do
    [:address, :city, :phone, :zip, :first_name, :last_name].each do |var|
      it { is_expected.to validate_presence_of(var) }
    end
  end

  context 'check for the number of characters' do
    [:address, :city, :first_name, :last_name].each do |var|
      it "validates_length_of #{var}" do
        should validate_length_of(var).is_at_most(50)
      end
    end
    it 'validate_length_of zip' do
      should validate_length_of(:zip).is_at_most(10)
    end
  end

  context 'check for validates_format_of' do
    it 'check the phone number' do
      ['0954161771', '80954161771', '+380954161771'].each do |num|
        should allow_values(num).for(:phone)
      end
    end

    it 'check for validate_format_of' do
      ['testnumbers', '8095e1617f1', '+380954161771+'].each do |num|
        should_not allow_values(num).for(:phone)
      end
    end
  end
end