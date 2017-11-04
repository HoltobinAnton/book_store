FactoryGirl.define do
  factory :picture do
    images do
      File.open(File.join(Rails.root, 'spec', 'support', 'images', 'test.jpeg'))
    end
    association :imageable, factory: :book
  end
end
 