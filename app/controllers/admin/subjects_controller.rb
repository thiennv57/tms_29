class Admin::SubjectsController < ApplicationController
  before_action :init_subject, only: [:show, :edit, :update, :destroy]
  
  def index
    @subject = Subject.new
    @subjects = Subject.all
  end  

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash.now[:success] = t "messages.admin.create.success"
    else
      flash.now[:failed] = t "messages.admin.create.fail"
    end
  end

  def update
    if @subject.update_attributes subject_params
      flash.now[:success] = t "messages.admin.update.success"
    else
      flash.now[:danger] = t "messages.admin.update.fail"
    end
  end
  
  def destroy
    if @subject.destroy
      flash.now[:success] = t "messages.admin.destroy.success"
    else
      flash.now[:failed] = t "messages.admin.destroy.fail"
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description,
      tasks_attributes: [:id, :name, :_destroy]
  end

  def init_subject
    @subject = Subject.find params[:id]
  end
end
