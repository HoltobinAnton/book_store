class OrderNotifierMailer < ActionMailer::Base
  default from: 'BookStore@example.com'

  def send_checkorder_email(order)
    @order = order
    mail(to: @order.user.email, subject: 'Confirmation order')
  end
end