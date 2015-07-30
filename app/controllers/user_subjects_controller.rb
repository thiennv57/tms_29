class UserSubjectsController < ApplicationController
  def update
    user_course = current_user.user_courses.find_by course_id: params[:course_id]
    @user_course_subject = user_course.user_course_subjects.find_by subject_id: params[:subject_id]
    @user_course_subject.send params[:status]
    redirect_to request.referer
  end
end
