class UserCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :user_course_subjects, dependent: :destroy
  has_many :subjects, through: :user_course_subjects
end
