class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper
  before_action :clear_search_index, only: [:index]

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end
  
  protected
  def after_sign_in_path_for resource
    current_user.admin? ? admin_root_path : root_path
  end

  def require_admin
    authenticate_user!
    redirect_to root_path unless current_user.admin?
  end
  
  def clear_search_index
    if params[:search_cancel]
      params.delete :search_cancel
      unless search_params.nil?
        search_params.each do |key, param|
          search_params[key] = nil
        end
      end
    end
  end
end
