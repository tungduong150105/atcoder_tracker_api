class SubmitRecord < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  validates :status, presence: true
  validates :submission_id, presence: true, uniqueness: true
end
