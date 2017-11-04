FactoryGirl.define do
  factory :user do
    first_name 'f_name'
    last_name 'l_name'
    email { Faker::Internet.email }
    password { Devise.friendly_token.first(8) }
  end
end
