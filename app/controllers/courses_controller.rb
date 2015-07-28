class CoursesController < ApplicationController
  def show
    @user_course = current_user.user_courses.active_course.first
    @course = @user_course.course unless @user_course.nil?
    @course_subjects = @course.course_subjects
    @users = @course.users
  end
end
