class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper

  private
  def require_admin
    unless current_user.admin?
      flash[:danger] = t "require.require_admin"
      redirect_to root_path
    end
  end
end
