json.orders @order_relationship do |order|
  json.id order.id
  json.status_name OrderRelationship.status_product_order[order.status]
  json.status order.status
  json.product_name order.product.name
  json.value_original order.product.value
  json.promotion order.product.promotion
  json.value order.product.promotion || order.product.value
  json.client_name order.product.client.company_name
  json.product_type Product.product_types[order.product.product_type.to_i]
  json.extras Extra.where(id: order.extra_ids) unless order.extra_ids.empty?
  json.total_value order.product.promotion ? order.product.promotion + Extra.where(id: order.extra_ids).map(&:price).sum : order.product.value + Extra.where(id: order.extra_ids).map(&:price).sum
end
