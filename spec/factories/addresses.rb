FactoryGirl.define do
  factory :address do
    address Faker::Address.street_address
    phone Faker::PhoneNumber.cell_phone
    zip Faker::Address.zip
    countries { create_list :country, 2 }
  end
end
