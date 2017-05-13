class BookDecorator < Draper::Decorator
  delegate_all
   include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TextHelper

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

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

  
end
