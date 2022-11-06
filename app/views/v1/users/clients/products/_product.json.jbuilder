json.id product.id
json.name product.name
json.description product.description
json.value product.value
json.promotion product.promotion
json.image product.image.attached? ? polymorphic_url(product.image) : nil
json.duration_estimation product.duration_estimation
json.stock product.stock
json.extras product.extras
json.product_type Product.product_types[product.product_type.to_i]
