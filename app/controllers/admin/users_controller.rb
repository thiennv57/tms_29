class Admin::UsersController < ApplicationController
  before_action :init_user, only: [:show, :destroy, :update]
  before_action :require_admin

  def index
    @users = User.paginate page: params[:page], per_page: Settings.per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "messages.admin.create.success"
      redirect_to admin_user_path @user
    else
      flash.now[:failed] = t "messages.admin.create.fail"
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "messages.admin.destroy.success"
    else
      flash[:failed] = t "messages.admin.destroy.fail"
    end
    respond_to do |format|
      format.html {redirect_to admin_root_url}
      format.js
    end
  end

  def update
    if @user.update_attributes set_admin_params
      flash[:success] = t "messages.admin.update.success"
    else
      flash[:failed] = t "messages.admin.update.fail"
    end
    respond_to do |format|
      format.html {redirect_to admin_root_url}
      format.js
    end
  end

  private
  def init_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit :id, :name, :email, :password, :password_confirmation
  end

  def set_admin_params
    params.require(:user).permit :admin
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
