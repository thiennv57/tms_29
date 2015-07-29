class UserCourse < ActiveRecord::Base
  include InitActivity
  belongs_to :user
  belongs_to :course
  has_many :user_course_subjects, dependent: :destroy
  has_many :subjects, through: :user_course_subjects

  after_create :supervisor_assign_trainee_activity
  before_destroy :supervisor_remove_trainee_activity

  private
  def supervisor_assign_trainee_activity
    create_activity self.user_id, self.user_id,
      Settings.activities.supervisor_assign_trainee
  end

  def supervisor_remove_trainee_activity
    create_activity self.user_id, self.user_id,
      Settings.activities.supervisor_remove_trainee
  end
end
