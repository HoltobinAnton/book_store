FactoryGirl.define do
  factory :order_item do
    association :book
    association :order
    quantity 50
  end
end
