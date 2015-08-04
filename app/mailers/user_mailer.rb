class UserMailer < ApplicationMailer

  def notice_course_status user, course 
    @notification = I18n.t("notifications.notice_course_status", name: course.name)
    mail to: user.email
  end

  def notice_assign_trainee user, course
    @user = user
    @course = course
    mail to: user.email, subject: I18n.t("mailer.assigned")
  end

  def notice_unassign_trainee user, course
    @user = user
    @course = course
    mail to: user.email, subject: I18n.t("mailer.unassigned")
  end
end
