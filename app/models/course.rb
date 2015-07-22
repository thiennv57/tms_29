class Course < ActiveRecord::Base
  include InitActivity
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses

  scope :active_course, ->{where active: true}

  def supervisor_update_course_activity user
    create_activity user.id, self.id, 
      Settings.activities.supervisor_update_course
  end
end
