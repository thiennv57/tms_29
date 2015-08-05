class UserMailer < ApplicationMailer

  def notice_new_user user
    @user = user
    mail to: user.email, subject: I18n.t("mailer.new_user")
  end

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

  def trainee_daily_report_infomation course
    users = course.users
    @activities = Activity.activities_by_user_ids(users.pluck :id)
      .daily_report(Settings.activities.trainee_finish_task).recent.decorate
    course.users.admins.each do |user|
      mail to: user.email
    end
  end

  def notice_course_active user, course
    @course = course
    mail to: user.email, subject: I18n.t("mailer.course_active")
  end
end
