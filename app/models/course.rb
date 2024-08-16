class Course < ApplicationRecord
  validates :course_name,
            presence: true,
            format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters, numbers, and whitespaces" }
  validates :teacher_name,
            presence: true,
            format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and whitespaces" }
  validates :course_description,
            length: { maximum: 500 },
            format: { with: /\A[a-zA-Z0-9\s.,!?]+\z/, message: "only allows letters, numbers, whitespaces, and punctuation" },
            allow_blank: true
end
