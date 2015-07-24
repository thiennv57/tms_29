class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject

  STATUS = {UNSTART: "unstart", STARTED: "started", FINISHED: "finished"}

  def start_subject course
    self.update_attributes status: STATUS[:STARTED]
    course.user_courses.each do |user_course|
      self.subject.user_courses << user_course
    end
  end

  def finish_subject
    self.update_attributes status: STATUS[:FINISHED]
  end

  def finished?
    self.status == STATUS[:FINISHED]
  end
end
