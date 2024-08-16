class Course < ApplicationRecord
  validates :course_name, presence: true
  validates :teacher_name, presence: true
end
