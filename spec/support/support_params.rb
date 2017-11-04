module SupportParams

  def valid_credit_card
    { 'card_number' => '12341234123414', 'card_name' => 'Visa', 'exp-date' => '11/18', "cvv" => '1234' }
  end

  def invalid_credit_card
    { 'card_number' => '1241', 'card_name' => '', 'exp-date' => '11/18', "cvv" => '1234' }
  end

  def valid_address_bill
    { fname_bil: 'Anton', lname_bil: 'Lname', address_bil: 'Testaddress',
        city_bil: 'City', phone_bil: '053151231',country_bil: '1', zip_bil: '1234'}
  end

  def valid_review_params(id)
    { review: { title: 'Tile', description: 'Desc....',
                rating: '4', book_id: id } }
  end

  def invalid_review_params(id)
    { review: { title: "title"*30, description: 'Desc....',
                rating: '4', book_id: id } }
  end

  def address_params
    { fname_bil: 'Anton', lname_bil: 'Lname', address_bil: 'Testaddress',
        city_bil: 'City', phone_bil: '053151231',country_bil: '1', zip_bil: '1234',
        fname_ship: 'Anton2', lname_ship: 'Lname2', address_ship: 'Testaddress2',
        city_ship: 'City2', phone_ship: '053151231',country_ship: '1', zip_ship: '4321'}
  end

  def fill_in_signin_fields(email, pass)
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: pass
    click_button I18n.t('sign_in')
  end

  def fill_in_signup_fields(email, pass)
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: pass
    fill_in 'user[password_confirmation]', with: pass
    click_button I18n.t('sign_up')
  end

end