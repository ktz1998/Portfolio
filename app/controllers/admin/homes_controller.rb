class Admin::HomesController < ApplicationController
  def top
    @users = User.page(params[:page]).per(10)
  end
  
  private
  def user_params
    params.require(:user).permit(:is_deleted, :name, :email)
  end
end
