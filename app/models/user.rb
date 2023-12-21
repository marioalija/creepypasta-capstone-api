class User < ApplicationRecord
  # has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :stories
  has_many :comments
end
