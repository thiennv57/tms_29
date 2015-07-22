class Admin::CourseSubjectsController < ApplicationController
  before_action :init_course_subject, only: [:update]

  def update
    case params[:status]
    when CourseSubject::STATUS[:STARTED]
      @course_subject.start_subject @course_subject.course, current_user
    when CourseSubject::STATUS[:FINISHED]
      @course_subject.finish_subject current_user
    end
    respond_to do |format|
      format.html {redirect_to admin_course_path(@course_subject.course)}
      format.js
    end
  end

  private
  def init_course_subject
    @course_subject = CourseSubject.find params[:course_subject_id]
  end
end
