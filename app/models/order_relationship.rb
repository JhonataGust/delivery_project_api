class OrderRelationship < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def self.status_product_order
    [
      'Aguardando ser Confirmado',
      'Produto Confirmado',
      'Produto Pronto',
      'Produto a Caminho',
      'Entregue'
    ]
  end
end
