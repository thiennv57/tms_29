class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper
  before_action :clear_search_index, only: [:index]

  private
  def require_admin
    unless current_user.admin?
      flash[:danger] = t "require.require_admin"
      redirect_to root_path
    end
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
