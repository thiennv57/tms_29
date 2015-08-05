class AnnouceCourseActive
  include Sidekiq::Worker

  def perform course_id
    course = Course.find course_id
    course.users.each do |user|
      UserMailer.notice_course_active(user, course).deliver
    end
  end
end
