class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :runs
  has_many :months, through: :runs

end
