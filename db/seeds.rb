
Author.destroy_all
Book.destroy_all
Category.destroy_all
Order.destroy_all
OrderItem.destroy_all

category_array = ['Mobile development',
  'Photo',
  'Web design',
  'Web development']

  category_array.count.times do |item|
    category = Category.new
    category.title = category_array[item]
    category.save!
  end
 
 rand(3..15).times do
   author = Author.new
   author.first_name = Faker::Name.first_name
   author.last_name = Faker::Name.last_name
   author.save!
end


Dimension.destroy_all
rand(2..4).times do
  dimension = Dimension.new
  dimension.H = rand(5..13)
  dimension.W = rand(6..11)
  dimension.D = rand(4..12)
  dimension.save!
end

rand(10..80).times do
  book = Book.new
  book.title = Faker::Book.title
  book.price = Faker::Number.decimal(2, 2)
  book.quantity = rand(40..350)
  rand(2..3).times do
    book.authors  << Author.find(rand( Author.first.id .. Author.last.id ))
  end
  book.categories << Category.find(rand( Category.first.id .. Category.last.id ))
  book.dimension_id = Dimension.find(rand( Dimension.first.id .. Dimension.last.id )).id
  book.save!
end   


materials = ['Hardcove',
  'Glossy paper',
  'Offset',
  'Coated',
  'Design',
  'Carton']

  Material.destroy_all


  materials.count.times do |item|
    material = Material.new
    material.title = materials[item]
    material.save!
  end

  Book.all.each do |book|
    book.year_publication = rand( 1200 .. 2017 )
    book.description = Faker::Lorem.sentence(50)
    rand(1..2).times do |index|
      book.materials << Material.where('title' => materials[rand(1..materials.count-1)])
      book.save!
    end
    book.save!
  end

