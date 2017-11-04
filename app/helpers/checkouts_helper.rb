module CheckoutsHelper
  def check_address_first
    if current_user.addresses.first.nil?
      current_user.addresses.new
    else
      current_user.addresses.first
    end
  end

  def check_address_second
    if current_user.addresses.second.nil?
      current_user.addresses.new
    else
      current_user.addresses.second
    end
  end

  def countries_array
    Country.all.map { |country| [country.name, country.id] }
  end

  def get_country_first
    Country.where(id: self.country_id)
  end

  def delivery_days(delivery)
    "#{delivery.min_day} to #{delivery.max_day} days"
  end

  def delivery_price(delivery)
    "€#{delivery.price}"
  end

  def full_name(address)
    "#{address.first_name.capitalize} #{address.last_name.capitalize}"
  end

  def get_address(value)
    value.address
  end

  def get_city_zip(address)
    "#{address.city.capitalize} #{address.zip}"
  end
  
  def get_phone(address)
    "Phone: #{address.phone}"
  end

  def hide_credit_card(card)
    '*'*12 + "#{card.card_number.slice(-4..-1)}"
  end

  def mount_year(card)
    "#{card.mount}/#{card.year}"
  end

end
