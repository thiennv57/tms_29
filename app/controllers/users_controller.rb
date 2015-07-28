class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    @course = @user.courses.active_course.first
    unless @course.nil? 
      @user_course = @user.user_courses.find_by_course_id(@course.id)
    end
  end

  def update
    if @user.update user_params
      sign_in @user, bypass: true
      flash[:success] = t "messages.user.update.success"
      redirect_to user_path @user
    else
      flash.now[:failed] = t "messages.user.update.fail"
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit :id, :name, :email,
      :avatar, :password, :password_confirmation
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user? @user
  end
end
