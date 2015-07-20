class User < ActiveRecord::Base
  attr_accessor :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  mount_uploader :avatar, AvatarUploader
end
