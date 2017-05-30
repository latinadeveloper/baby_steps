class User < ApplicationRecord
  validates :name, presence:true, uniqueness: true, length: { minimum: 4 }
  validates :password, length: { in: 6..20 }
  validates :password_confirmation, presence: true

  has_secure_password
end
