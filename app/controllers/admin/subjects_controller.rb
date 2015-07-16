class Admin::SubjectsController < ApplicationController
  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash.now[:success] = t "admin.create.success"
      redirect_to admin_subjects_path 
    else
      flash.now[:failed] = t "admin.create.fail"
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description,
      tasks_attributes: [:id, :name, :_destroy]
  end
end
