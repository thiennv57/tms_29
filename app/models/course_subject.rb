class CourseSubject < ActiveRecord::Base
  include InitActivity
  belongs_to :course
  belongs_to :subject

  STATUS = {UNSTART: "unstart", STARTED: "started", FINISHED: "finished"}

  def start_subject course, user
    self.update_attributes status: STATUS[:STARTED]
    course.user_courses.each do |user_course|
      self.subject.user_courses << user_course
    end
    create_activity user.id, self.id, 
      Settings.activities.supervisor_start_subject
  end

  def finish_subject user
    self.update_attributes status: STATUS[:FINISHED]
    create_activity user.id, self.id, 
      Settings.activities.supervisor_finish_subject
  end

  def finished?
    self.status == STATUS[:FINISHED]
  end
end
