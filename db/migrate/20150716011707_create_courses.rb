class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.boolean :active, default: false
      t.datetime :active_at
      t.integer :day_word 
      
      t.timestamps null: false
    end
  end
end
