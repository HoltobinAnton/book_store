require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Association' do
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:delivery) }
    it { is_expected.to belong_to(:credit_card) }
  end

  describe 'scopes' do
    let(:order_one) { create :order }
    let(:order_two) { create :order, state: 'in_delivery' }
    let(:order_three) { create :order, state: 'delivered' }
    let(:order_four) { create :order, state: 'canceled' }

    it 'should return the order where state eql waiting_processing' do
      Order.by_waiting.should eq [order_one]
    end

    it 'should return the order where state eql in_delivery' do
      Order.by_delivery.should eq [order_two]
    end

    it 'should return the order where state eql in_delivered' do
      Order.by_delivered.should eq [order_three]
    end

    it 'should return the order where state eql canceled' do
      Order.by_cancel.should eq [order_four]
    end
  end

  describe 'checking the states' do
    it 'the default state is in_draft' do
      expect(subject).to have_state(:waiting_processing)
    end

    it 'transition to delivering state' do
      subject.in_delivering
      expect(subject).to have_state(:in_delivery)
    end

    it 'transition to delivered state' do
      subject.in_delivering
      subject.was_delivered
      expect(subject).to have_state(:delivered)
    end

    it 'transition to canseled state' do
      expect(subject).to transition_from(:waiting_processing,
        :in_delivery, :delivered).to(:canceled).on_event(:cancel)
    end

    it 'shoud return the defalt state' do
      expect(subject).to transition_from(:canceled).to(:waiting_processing).
        on_event(:default_state)
    end
  end

end