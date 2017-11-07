FactoryGirl.define do
  factory :category do
    title Faker::Book.title
    books { create_list :book, 3 }
  end
end
