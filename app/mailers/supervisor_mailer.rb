class SupervisorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.supervisor_mailer.monthly_report.subject
  #
  def monthly_report supervisor
    @courses = supervisor.courses
    @supervisor = supervisor
    mail to: supervisor.email, subject: I18n.t("mailer.monthly_report")
  end
end
