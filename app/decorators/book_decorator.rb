class BookDecorator < Draper::Decorator
  delegate_all

  def authors_list
    authors.map do |author|
      "#{author.first_name} "+ "#{author.last_name}"
    end.join(', ')
  end

  def main_image
    photos_url
  end

  def materials_list
    materials.map do |material|
      "#{material.title}"
    end.join(', ')
  end

  def price_from_euro
    "€#{price.round(2)}"
  end

  def dimension_attr
   "H: #{dimension.H}" + "x W: #{dimension.W}" + "x D: #{dimension.D}"
  end

  def rev_count
    "Reviews (#{reviews.where(state: 'published').size})"
  end

  def average_rating
    reviews.where(state: 'published').average('rating').to_i
  end

  
end
