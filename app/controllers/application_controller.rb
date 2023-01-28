class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_up_path_for(resource)
    root_path
    flash.now[:notice] = "新規登録に成功、ようこそデバイス見聞録へ！"
  end
  
  def after_sign_in_path_for(resource)
    items_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  #ユーザー登録時ユーザー名操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
