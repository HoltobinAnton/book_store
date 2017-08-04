FactoryGirl.define do
  factory :book do
    title Faker::Book.title
    price Faker::Number.decimal(2, 2)
    quantity 15
    photos "MyPathPhotos"
    description Faker::Lorem.sentence(50)
    year_publication 1465
    dimension { create :dimension }
    authors { create_list :author, 3 }
    materials { create_list :material, 2 }
    #after(:create) do |book|
    #  book.authors << create(:author)        
    #  book.authors << create(:author, first_name: 'Fname2', last_name: 'Lname2') 
    #  book.materials << create(:material, title: 'Design')
    #  book.materials << create(:material, title: 'Carton')
    #end
  end
end
 