class UserCourseSubject < ActiveRecord::Base
  belongs_to :user_course
  belongs_to :subject
  has_many :activites, dependent: :destroy
end
