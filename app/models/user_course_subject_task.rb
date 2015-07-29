class UserCourseSubjectTask < ActiveRecord::Base
  include InitActivity
  belongs_to :user_course_subject
  belongs_to :task

  after_create :trainee_finish_task

  private
  def trainee_finish_task
    user = self.user_course_subject.user_course.user
    create_activity user.id, self.id,
      Settings.activities.trainee_finish_task
  end
end
