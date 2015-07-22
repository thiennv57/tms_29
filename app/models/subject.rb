class Subject < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :user_course_subjects, dependent: :destroy
  has_many :user_courses, through: :user_course_subjects
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc {|attributes| attributes[:name].blank?}
end
