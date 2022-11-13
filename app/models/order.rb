class Order < ApplicationRecord
  belongs_to :user
  has_many :order_relationships, dependent: :destroy
end
