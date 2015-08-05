class AnnouceNewUser
  include Sidekiq::Worker

  def perform user_id
    user = User.find user_id
    UserMailer.notice_new_user(user).deliver
  end
end
