json.order_calls @call_orders do |order_relationship|
  json.id order_relationship.id
  json.user_name order_relationship.order.user.full_name.split(' ')[0]
  json.status_name OrderRelationship.status_product_order[order_relationship.status]
  json.status order_relationship.status
  json.product_name order_relationship.product.name
  json.value_original order_relationship.product.value
  json.promotion order_relationship.product.promotion
  json.value order_relationship.product.promotion || order_relationship.product.value
  json.client_name order_relationship.product.client.company_name
  json.extras order_relationship.product.extras
  json.product_type Product.product_types[order_relationship.product.product_type.to_i]
end
