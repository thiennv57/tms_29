class UserCourseSubject < ActiveRecord::Base
  belongs_to :user_course
  belongs_to :subject
  has_many :user_course_subject_tasks, dependent: :destroy
  has_many :tasks, through: :user_course_subject_tasks

  accepts_nested_attributes_for :user_course_subject_tasks

  before_create :set_tasks

  private
  def set_tasks
    subject.tasks.each do |task|
      self.user_course_subject_tasks.build task_id: task.id, status: Settings.status.inactive
    end
  end
end

