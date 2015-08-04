class UserMailer < ApplicationMailer

  def notice_course_status user, course 
    @notification = I18n.t("notifications.notice_course_status", name: course.name)
    mail to: user.email
  end
end
