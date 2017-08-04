FactoryGirl.define do
  factory :order do
    user

    trait :with_items do
      order_items { create_list(:order_item, 3) }
    end

    trait :with_item do
      order_items { create_list :order_item, 1 }
    end
    
  end
end
