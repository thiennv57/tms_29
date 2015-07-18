class Admin::UsersController < ApplicationController
  before_action :init_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "messages.admin.create.success"
      redirect_to admin_user_path @user
    else
      flash.now[:danger] = t "messages.admin.create.fail"
      render "new"
    end
  end

  private
  def init_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit :id, :name, :email, :password, :password_confirmation
  end
end
