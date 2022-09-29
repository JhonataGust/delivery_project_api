class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true
  validates :full_name, presence: true
  
end
