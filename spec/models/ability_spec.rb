#   should have_abilities(:create, Post.new)
#   should have_abilities([:read, :update], post)
#   should have_abilities({manage: false, destroy: true}, post)
#   should have_abilities({create: false}, Post.new)
#   should not_have_abilities(:update, post)
#   should not_have_abilities([:update, :destroy], post)

require 'rails_helper'

RSpec.describe Ability, type: :model do
  subject(:ability) { Ability.new(user) }
  let(:user) { build(:user) }
  let(:authorized_user) { create(:user) }
  let(:admin) { create(:user, admin: true) }

  context 'should have_abilities' do
    it { should be_able_to(:read, Book) }
    it { should be_able_to(:read, Review) }
  end

  context 'should not have ability' do
    it { should_not be_able_to(:create, Review) }
  end

  context 'User has rights when he is authorized' do
    subject(:ability) { Ability.new(authorized_user) }
    it { should be_able_to(:create, Review) }
  end

  context 'admin should manage all' do
    subject(:ability) { Ability.new(admin) }
    it { should be_able_to(:manage, :all) }
    
  end
end 