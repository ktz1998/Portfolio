class Public::UsersController < ApplicationController
  before_action :is_matching_login_user
  
  def show
    @user = User.find(params[:id])
    @items = @user.items.page(params[:page]).per(10)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "show"
    end
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to items_path
    end
  end
  
end
