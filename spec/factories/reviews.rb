FactoryGirl.define do
  factory :review do
    books
    user
    title Faker::Name.first_name
    description Faker::Lorem.sentence(12)
    rating 5
  end
end
