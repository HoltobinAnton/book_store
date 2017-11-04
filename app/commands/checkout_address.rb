class CheckoutAddress < Rectify::Command
  def initialize(order, params)
    @order = order
    @user = order.user
    @params = params
  end

  attr_reader :params

  def call
    return broadcast :invalid if address_form?
    transaction do
      save_and_set_user
      create_or_update_billing
      create_or_update_shipping
    end
    broadcast :valid
  end

  private

  def save_and_set_user
    @user.update_attributes(user_params)
    @order.user_id = @user.id
    @user.save
  end

  def user_params
    { first_name: params[:fname_bil], last_name: params[:lname_bil] }
  end

  def create_or_update_billing
    if @user.addresses[0].nil?
      @user.addresses.create(billing_form.to_h)
    else
      @user.addresses[0].update_attributes(billing_form.to_h.except(:id).to_h)
    end
    @user.save
  end

  def create_or_update_shipping
    if @user.addresses[1].nil?
      @user.addresses.create(shipping_form.to_h)
    else
      @user.addresses[1].update_attributes(shipping_form.to_h.except(:id).to_h)
    end
    @user.save
    @order.save
  end

  def address_form?
    billing_form.invalid? || shipping_form.invalid?
  end

  def billing_form
    AddressForm.new(first_name: params[:fname_bil],
                    last_name: params[:lname_bil],
                    address: params[:address_bil],
                    city: params[:city_bil],
                    phone: params[:phone_bil],
                    country_id: params[:country_bil],
                    zip: params[:zip_bil])
  end

  def shipping_form
    AddressForm.new(first_name: params[:fname_ship],
                    last_name: params[:lname_ship],
                    address: params[:address_ship],
                    city: params[:city_ship],
                    phone: params[:phone_ship],
                    country_id: params[:country_ship],
                    zip: params[:zip_ship])
  end
end