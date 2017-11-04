class CheckoutsController < ApplicationController
  include Wicked::Wizard
  skip_before_filter :setup_wizard, only: :confirm_email
  before_action :authenticate_user!
  before_action :order, only: [:show, :update]
  before_action :check_order_for_checkouts, only: [:update, :show]

  steps :address, :delivery, :payment, :confirm, :complete

  def show
    @user = current_user
    render_wizard
  end
  
  def update
    service = Object.const_get("Checkout#{step.capitalize}")
    service.call(@order, params) do
      on(:invalid) do
        flash[:danger] = t('flash.checkout.invalid')
        redirect_to wizard_path step
        end
      on(:valid) do
        flash[:success] = t('flash.checkout.valid')
        render_wizard @order
      end
    end
  end

  def finish_wizard
    session[:order_id] = nil unless session[:order_id].nil?
    redirect_to root_url
  end
  
  def confirm_email
    order = Order.find_by_confirm_token(params[:id])
    if order
      order.status_active
      flash[:success] = t('flash.checkout.v_confirm')
    else
      flash[:danger] = t('flash.checkout.i_confirm')
    end
    redirect_to root_url
  end

  private

  def order
    @order = current_order
    @order.user_id = current_user.id
    @order
  end

end