class CheckoutPayment < Rectify::Command
  def initialize(order, params)
    @order = order
    @params = params
  end

  attr_reader :params

  def call
    return broadcast :invalid if credit_card_form.invalid?
    transaction do
      set_mount
      set_year
      set_and_create_credit_card
      @order.save
    end
    broadcast :valid
  end

  private

  def credit_card_form
    CreditCardForm.new(card_number: params['card_number'],
      card_name: params['card_name'],
      mount: set_mount,
      year: set_year,
      cvv: params['cvv'])
  end
  
  def set_mount
    params['exp-date'].first(2)
  end
  
  def set_year
    params['exp-date'].last(2)
  end
  
  def set_and_create_credit_card
    @order.credit_card_id = CreditCard.create(credit_card_form.to_h).id
  end

end