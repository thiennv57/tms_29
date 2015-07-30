class UserCourseSubjectTask < ActiveRecord::Base
  include InitActivity
  belongs_to :user_course_subject
  belongs_to :task

  after_create :trainee_finish_task

  def finished?
    self.status == Settings.status.finished
  end

  private
  def trainee_finish_task
    user = self.user_course_subject.user_course.user
    create_activity user.id, task.id,
      Settings.activities.trainee_finish_task
  end
end
