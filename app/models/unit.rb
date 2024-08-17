class Unit < ApplicationRecord
  belongs_to :course
  acts_as_list scope: :course

  validates :unit_name,
            presence: true,
            length: { maximum: 50 },
            format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters, numbers, and whitespaces" }

  validates :unit_description,
            length: { maximum: 500 },
            format: { with: /\A[a-zA-Z0-9\s.,!?]+\z/, message: "only allows letters, numbers, whitespaces, and punctuation" },
            allow_blank: true

  validates :unit_content,
            presence: true,
            length: { maximum: 500 },
            format: { with: /\A[a-zA-Z0-9\s.,!?]+\z/, message: "only allows letters, numbers, whitespaces, and punctuation" }
end
