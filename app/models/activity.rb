class Activity < ActiveRecord::Base
  belongs_to :user_course_subject
  belongs_to :user
end
