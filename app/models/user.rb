class User < ApplicationRecord
  has_secure_password

  has_many :submit_records, dependent: :destroy
  has_many :attemped_problems, through: :submit_records, source: :problem

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :atcoder_handle, presence: true
end
