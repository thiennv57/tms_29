class Admin::CoursesController < ApplicationController
  before_action :init_course, only: [:show, :edit, :update, :destroy]
  
  def index
    @courses = current_user.courses
    @q = Course.ransack params[:q]
    @courses = @q.result distinct: true
    @q.build_sort if @q.sorts.empty?
  end

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

  def destroy
    if @course.destroy
      flash.now[:success] = t "messages.admin.destroy.success"
    else
      flash.now[:failed] = t "messages.admin.destroy.fail"
    end
    respond_to do |format|
      format.html {redirect_to admin_course_path(@course)}
      format.js
    end
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "messages.admin.update.success"
    else
      flash[:fail] = t "messages.admin.update.fail"
    end
    respond_to do |format|
      format.html {redirect_to admin_course_path(@course)}
      format.js
    end
  end
  
  private
  def course_params
    params.require(:course).permit :name, :description, :active, subject_ids: []
  end

  def init_course
    @course = Course.find params[:id]
  end
end
