class Admin::AssignUsersController < ApplicationController
  before_action :init_course ,only: [:edit, :update]

  def edit
    @users = User.availabe_to_assign @course.id
  end

  def update
    if @course.update_attributes assign_users_params
      flash[:success] = t "messages.admin.update.success"
      redirect_to admin_course_path @course
    else
      flash[:fail] = t "messages.admin.update.fail"
      redirect_to admin_root_url
    end
  end

  private
  def assign_users_params
    params.require(:course).permit user_ids: []
  end

  def init_course
    @course = Course.find params[:course_id]
  end
end
