class Course < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses

  scope :active_course, ->{where active: true}
end
