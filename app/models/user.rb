class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, confirmation: true

  has_many :runs
  has_many :months, through: :runs

end
