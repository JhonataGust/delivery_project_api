class Client < ApplicationRecord
  belongs_to :user

  validates :company_name, presence: true
  validates :short_name, presence: true
  validates :number, presence: true
  validates :email, presence: true
end
