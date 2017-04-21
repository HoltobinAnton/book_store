FactoryGirl.define do
  factory :coupon do
    secret_code 'Q12345'
    discount 15
    used_count 0
  end
end
