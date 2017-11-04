class CheckoutDecorator < Draper::Decorator
  delegate_all

  def first_name_billing
    user.first_name
  end

  def last_name_billing
    user.last_name
  end

end
