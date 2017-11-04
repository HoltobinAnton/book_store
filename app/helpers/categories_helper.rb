module CategoriesHelper

  SORT_TITLES = {latest: "Newest first", title_asc: "A - Z", title_desc: "Z - A", 
                low_price: "Price: low to high", high_price: "Price: high to low", popular: "Populat first"}.freeze
  def countries_array
    Country.all.map { |country| [country.name, country.id] }
  end

  def get_categories(sort_by)
    categories_path(sort_type: sort_by)
  end

  def get_category(category, sort_by)
    category_path(category, sort_type: sort_by)
  end
end
