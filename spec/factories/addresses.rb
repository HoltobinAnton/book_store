FactoryGirl.define do
  factory :address do
    address Faker::Address.street_address
    phone '124123232'
    zip 1123
    city Faker::Address.city
    user
    country
  end
end
