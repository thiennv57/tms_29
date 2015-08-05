class User < ActiveRecord::Base
  attr_accessor :avatar
  has_many :activities
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses, dependent: :destroy

  after_create :mail_to_new_user

  mount_uploader :avatar, AvatarUploader

  scope :admins, ->{where admin: true}
  scope :availabe_to_assign, ->course_id{where "id NOT IN (SELECT user_id FROM user_courses
    WHERE status = 't' AND course_id != ?)", course_id}

  def self.monthly_report
    User.admins.each do |supervisor|
      SupervisorMailer.monthly_report(supervisor).deliver_now
    end
  end

  private
  def mail_to_new_user
    AnnouceNewUser.perform_async self.id
  end
end
