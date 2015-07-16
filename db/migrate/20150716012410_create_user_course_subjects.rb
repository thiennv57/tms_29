class CreateUserCourseSubjects < ActiveRecord::Migration
  def change
    create_table :user_course_subjects do |t|
      t.string :status
      t.references :user_course, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
