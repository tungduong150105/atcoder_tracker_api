class Problem < ApplicationRecord
  has_many :submit_records, dependent: :destroy
  has_many :solvers, through: :submit_records, source: :user

  validates :atcoder_id, presence: true, uniqueness: true
  validates :title, presence: true
end
