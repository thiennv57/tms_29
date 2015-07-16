class User < ActiveRecord::Base
  has_many :activites, dependent: :destroy
  has_many :users_courses, dependent: :destroy
  has_many :courses, through: :user_courses
end
