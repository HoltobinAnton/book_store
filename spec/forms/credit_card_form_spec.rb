require 'rails_helper'

describe CreditCardForm, type: :model do
  context 'can not be nil (card_number, card_name, cvv, mount, year)' do
    [:card_number, :card_name, :cvv, :mount, :year].each do |var|
      it { is_expected.to validate_presence_of(var) }
    end
  end

  context 'check for the number of characters' do
    it 'validate_length_of card_number' do
      should validate_length_of(:card_number).is_at_most(16)
      should validate_length_of(:card_number).is_at_least(11)
    end
    it 'validate_length_of card_name' do
      should validate_length_of(:card_name).is_at_most(50)
      should validate_length_of(:card_name).is_at_least(3)
    end
    it 'validate_length_of cvv' do
      should validate_length_of(:cvv).is_at_most(5)
      should validate_length_of(:cvv).is_at_least(3)
    end
  end

  context 'validate_numericality_of (mount, year)' do
    it 'validate_numericality_of mount' do
      should validate_numericality_of(:mount).is_greater_than(0)
      should validate_numericality_of(:mount).is_less_than_or_equal_to(12)
      should validate_numericality_of(:year).is_greater_than(0)
      should validate_numericality_of(:year).is_less_than_or_equal_to(50)
    end
  end

  context 'check for validates_format_of (card_number, card_name, cvv)' do
    ['5105105105105100',
     '4111111111111111',
     '4012888888881881',
     '6331101999990016',
     '6011000990139424'].each do |num|
       it "check the card number #{num}" do
         should allow_values(num).for(:card_number)
       end
     end
    ['Visa',
     'AmericanExpress',
     'AustralianBankCard',
     'Discover',
     'MasterCard'].each do |num|
        it "check the card name #{num}" do
          should allow_values(num).for(:card_name)
        end
      end
  end

end