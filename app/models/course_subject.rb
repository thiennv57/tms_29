class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject

  UNSTART = "unstart"
  STARTED = "started"
  FINISHED = "finished"

  def finished?
    self.status == FINISHED
  end
end
