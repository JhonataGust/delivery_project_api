class Product < ApplicationRecord
  belongs_to :client
  has_many :extras, dependent: :destroy
  has_many :order_relationships,dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :value, presence: true
  validates :product_type, presence: true


  def self.product_types
    [
      "",
      "Porções",
      "Drinks",
      "Lanches",
      "Sorvets"
    ]
  end
end
