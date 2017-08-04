class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

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

end
