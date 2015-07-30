class ActivityDecorator < Draper::Decorator
  delegate_all

  def display
    user = User.find user_id
    target = user
    case activity_type
    when Settings.activities.supervisor_update_course
      target = Course.find target_id
      display_base_on_type "supervisor_update_course", user, target
    when Settings.activities.admin_update_subject
      target = Subject.find target_id
      display_base_on_type "admin_update_subject", user, target
    when Settings.activities.supervisor_start_subject
      target = Subject.find target_id
      display_base_on_type "supervisor_start_subject", user, target
    when Settings.activities.supervisor_finish_subject
      target = Subject.find target_id
      display_base_on_type "supervisor_finish_subject", user, target
    when Settings.activities.trainee_finish_task
      target = Task.find target_id
      display_base_on_type "trainee_finish_task", user, target
    when Settings.activities.supervisor_assign_trainee
      target = User.find target_id
      display_base_on_type "supervisor_assign_trainee", user, target
    else Settings.activities.supervisor_remove_trainee
      target = User.find target_id
      display_base_on_type "supervisor_remove_trainee", user, target
    end
  end

  def display_base_on_type action, user, target
    I18n.t("activities." << action, user_name: user.name, target_name: target.name)
  end
end
