class Admin::CoursesController < ApplicationController
  before_action :init_course, only: [:show, :edit, :update, :destroy]
  
  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    @subjects = Subject.all
    @course.users << current_user
    if @course.save
      flash[:success] = t "messages.admin.create.success"
      redirect_to admin_course_path @course
    else
      render :new
    end
  end

  def show
    @subjects = @course.subjects
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "messages.admin.update.success"
    else
      flash[:fail] = t "messages.admin.update.fail"
    end
    redirect_to admin_course_path @course
  end
  
  private
  def course_params
    params.require(:course).permit :name, :description, subject_ids: []
  end  

  def init_course
    @course = Course.find params[:id]
  end
end
