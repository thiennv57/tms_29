class UserCourseSubject < ActiveRecord::Base
  include InitActivity
  belongs_to :user_course
  belongs_to :subject
  has_many :user_course_subject_tasks, dependent: :destroy
  has_many :tasks, through: :user_course_subject_tasks

  accepts_nested_attributes_for :user_course_subject_tasks

  before_create :set_tasks

  def finished?
    self.status == Settings.status.finished
  end

  private
  def set_tasks
    subject.tasks.each do |task|
      self.user_course_subject_tasks.build task_id: task.id, status: Settings.status.inactive
    end
  end

  def finish
    self.update_attributes status: Settings.status.finished
    create_activity user_course.user.id, subject.id,
      Settings.activities.trainee_finish_subject
      Settings.activities.supervisor_assign_trainee
  end

  def reopen
    self.update_attributes status: Settings.status.inactive
    create_activity user_course.user.id, subject.id,
      Settings.activities.trainee_reopen_subject
  end
end

