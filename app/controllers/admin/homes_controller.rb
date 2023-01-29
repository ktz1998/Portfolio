class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @users = User.page(params[:page]).per(10)
  end
  
  def withdraw
    @user = User.find(params[:user_id]) # User.find_by(name: params[:user_id])
    @user.update(is_deleted: true)
    redirect_to admin_top_path
  end
  
  private
  def user_params
    params.require(:user).permit(:is_deleted, :name, :email)
  end
end
