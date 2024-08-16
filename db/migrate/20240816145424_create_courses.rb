class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :teacher_name
      t.text :course_description

      t.timestamps
    end
  end
end
