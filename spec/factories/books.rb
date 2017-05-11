FactoryGirl.define do
  factory :book do
    title "MyString"
    price Faker::Number.decimal(2, 2)
    quantity 15
    photos "MyPathPhotos"
    description Faker::Lorem.sentence(50)
    year_publication 1465
    dimension
    after(:create) do |book|
      book.authors << create(:author)        
      book.authors << create(:author, first_name: 'Fname2', last_name: 'Lname2') 
      book.dimension = create(:dimension)
      book.materials << create(:material)
      book.materials << create(:material, title: 'Carton')
    end
  end
end
 