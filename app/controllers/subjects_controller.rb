class SubjectsController < ApplicationController
  def show
    user_course = current_user.user_courses.find_by course_id: params[:course_id]
    @user_course_subject = user_course.user_course_subjects.find_by subject_id: params[:id]
    unless @user_course_subject.nil?
      @subject = @user_course_subject.subject
    end
  end

  def update
    user_course = current_user.user_courses.find_by course_id: params[:course_id]
    @user_course_subject = user_course.user_course_subjects.find_by subject_id: params[:id]
    if @user_course_subject.update_attributes user_course_subject_params
      flash[:success] = t "messages.user.update.success"
      redirect_to root_url
    else
      render :show
      flash[:danger] = t "messages.user.update.fail"
    end
  end

  private
  def user_course_subject_params
    params.require(:user_course_subject)
      .permit :status, user_course_subject_tasks_attributes: [:id, :status, :task_id]
  end
end
