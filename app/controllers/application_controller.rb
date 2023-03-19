class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_search
  
  def after_sign_up_path_for(resource)
    root_path
  end
  
  def after_sign_in_path_for(resource)
    items_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  # def set_search
  #   @search = Item.ransack(params[:q])
  #   @search_items = @search.result
  # end

  protected

  #ユーザー登録時ユーザー名操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
