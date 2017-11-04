class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  SORT_DEF = :all

  def show
    orders = @user.orders
    @sort_title = sort_type
    @orders = orders.send(sort_type).page(params[:page])
  end
  
  def edit
    unless params[:commit].nil?
      SetUserService.call(@user, params) do
        on(:invalid) do |mess|
          flash[:danger] = mess
          redirect_to edit_path
        end
        on(:valid) do
          flash[:success] = t('flash.user.success')
          redirect_to root_path
        end
      end  
    end
  end

  def update
    if @user.update(user_params)
      bypass_sign_in(@user)
      flash[:success] = t('flash.user.success')
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def sort_type
    return SORT_DEF if params[:sort_type].nil?
    params[:sort_type]
  end

  def set_user
    @user ||= current_user
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email)
  end

end
