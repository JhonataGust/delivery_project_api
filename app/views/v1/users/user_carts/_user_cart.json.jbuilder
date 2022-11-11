json.id user_cart.id
json.product_name user_cart.product.name
json.product_decription user_cart.product.description
json.product_promotion user_cart.product.promotion
json.product_value user_cart.product.value
json.product_image user_cart.product.image.attached? ? polymorphic_url(user_cart.product.image) : ''
if !user_cart.extra_ids.empty?
json.extras Extra.where(id: user_cart.extra_ids)
end
json.total_value user_cart.product.promotion ? user_cart.product.promotion + Extra.where(id: user_cart.extra_ids).map(&:price).sum :  user_cart.product.value + Extra.where(id: user_cart.extra_ids).map(&:price).sum
