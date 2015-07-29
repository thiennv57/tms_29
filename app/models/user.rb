class User < ActiveRecord::Base
  attr_accessor :avatar
  has_many :activities
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  mount_uploader :avatar, AvatarUploader

  scope :availabe_to_assign, ->course_id{where "id NOT IN (SELECT user_id FROM user_courses 
    WHERE status = 't' AND course_id != ?)", course_id}
end
