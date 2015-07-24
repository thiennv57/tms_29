class UserCourseSubject < ActiveRecord::Base
  belongs_to :user_course
  belongs_to :subject
  has_many :user_course_subject_tasks, dependent: :destroy
  has_many :tasks, through: :user_course_subject_tasks

end
