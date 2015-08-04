class MailingJob < Struct.new(:course)
  def perform
    course.users.admins.each do |supervisor|
      UserMailer.notice_course_status(supervisor, course).deliver_now
    end
  end
end
