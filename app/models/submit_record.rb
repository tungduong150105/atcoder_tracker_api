class SubmitRecord < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  attr_readonly :user_id, :problem_id, :submission_id

  validates :status, presence: true
  validates :submission_id, presence: true, uniqueness: true
end
