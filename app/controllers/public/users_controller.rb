class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items.page(params[:page]).per(10)
  end

  def edit
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

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
