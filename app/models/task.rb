class Task < ActiveRecord::Base
  belongs_to :subject
  has_many :user_course_subject_tasks, dependent: :destroy
  has_many :user_course_subjects, through: :user_course_subject_tasks
end
