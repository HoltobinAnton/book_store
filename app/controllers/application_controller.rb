class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :set_locale

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      current_user_id
    end
  end

  def current_user_id
    user_signed_in? ? Order.new(user_id: current_user.id) : Order.new
  end
  
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def check_order_for_checkouts
    redirect_to root_path if current_order.order_items.empty?
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
   { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
end
