class Course < ApplicationRecord
  has_many :units, -> { order(:position) }, dependent: :destroy
  accepts_nested_attributes_for :units, allow_destroy: true

  validates :course_name,
            presence: true,
            length: { maximum: 50 },
            format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters, numbers, and whitespaces" }

  validates :teacher_name,
            presence: true,
            length: { maximum: 50 },
            format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and whitespaces" }

  validates :course_description,
            length: { maximum: 500 },
            format: { with: /\A[a-zA-Z0-9\s.,!?]+\z/, message: "only allows letters, numbers, whitespaces, and punctuation" },
            allow_blank: true
end
