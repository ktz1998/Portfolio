# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  #ゲストログイン機能
  def new_guest
    user = User.guest
    sign_in user   # ユーザーをログインさせる
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  #退会ユーザーの重複登録阻止
  def reject_inactive_user
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_valid
        redirect_to new_user_session_path
      end
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
