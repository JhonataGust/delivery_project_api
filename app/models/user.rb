class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, on: :create
  validates :full_name, presence: true, on: :create

  has_many :addresses
  has_many :clients

  has_one_attached :avatar
end
