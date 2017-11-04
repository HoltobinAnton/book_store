class SetUserService < Rectify::Command
  def initialize(user, params)
    @user = user
    @params = params
  end

  attr_reader :params

  def call
    return broadcast :invalid if billing_form.invalid?
    transaction do
      save_address_to_user
    end
    broadcast :valid
  end

  private

  def save_address_to_user
    if @user.addresses[0].nil?
      @user.addresses.create(billing_form.to_h)
    else
      @user.addresses[0].update_attributes(billing_form.to_h.except(:id).to_h)
    end
    @user.save
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
end