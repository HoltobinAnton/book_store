FactoryGirl.define do
  factory :book do
    title "MyString"
    price 11.5
    quantity 15
    photos "MyPathPhotos"
    description "MyText"
    year_publication 1
    dimension

    after(:after) do |book|
      book.authors << FactoryGirl.create(:author)
    end
  end
end
 