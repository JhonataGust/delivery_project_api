json.id order.id
json.total_value order.value
json.accepted order.order_relationships.where(accepted: true).count == order.order_relationships.count
json.order_created_at "#{order.created_at.strftime('%d/%m/%Y')} ás #{ order.created_at.strftime('%H:%M')}"
json.payment_type order.payment_type
json.order_relationships order.order_relationships do |order_relationship|
    json.id order_relationship.id
    json.status_name OrderRelationship.status_product_order[order_relationship.status]
    json.status order_relationship.status
    json.product_name order_relationship.product.name
    json.value_original order_relationship.product.value
    json.promotion order_relationship.product.promotion
    json.value order_relationship.product.promotion ? order_relationship.product.promotion : order_relationship.product.value
    json.client_name order_relationship.product.client.company_name
    json.product_type Product.product_types[order_relationship.product.product_type.to_i]
end
