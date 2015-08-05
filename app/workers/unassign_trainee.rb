class UnassignTrainee
  include Sidekiq::Worker

  def perform course_id
    course = Course.find course_id
    course.users.each do |user|
      UserMailer.notice_unassign_trainee(user, course).deliver
    end
  end
end
