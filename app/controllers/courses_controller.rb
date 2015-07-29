class CoursesController < ApplicationController
  def show
    @course = @user.courses.active_course.first
    unless @course.nil?
   	  @course_subjects = @course.course_subjects
    end
    @users = @course.users
  end
end
