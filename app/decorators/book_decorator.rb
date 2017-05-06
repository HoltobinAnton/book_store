class BookDecorator < Draper::Decorator
  delegate_all

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

  def materials_list
    materials.map do |material|
      "#{material.title}"
    end.join(', ')
  end

  def dimension_attr
   "H: #{dimension.H}" + "x W: #{dimension.W}" + "x D: #{dimension.D}"
  end
end
