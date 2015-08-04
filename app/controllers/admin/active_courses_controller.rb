class Admin::ActiveCoursesController < ApplicationController
  before_action :init_course, only: [:update]
 
  def update
    @course.active_course
    flash[:success] = t "messages.admin.update.success"
    respond_to do |format|
      format.html {redirect_to admin_courses_path}
      format.js
    end
  end
  
  private
  def init_course
    @course = Course.find params[:course_id]
  end
end
