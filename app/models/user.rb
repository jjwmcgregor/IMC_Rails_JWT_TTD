class User < ApplicationRecord
  # encrypt password
  has_secure_password

  belongs_to :role
  belongs_to :course
  belongs_to :cohort

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
