class CreateUserCourseSubjectTasks < ActiveRecord::Migration
  def change
    create_table :user_course_subject_tasks do |t|
      t.string :status
      t.references :user_course_subject, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
