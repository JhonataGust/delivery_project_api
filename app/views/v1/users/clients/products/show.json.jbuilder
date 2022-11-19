json.product do
  json.partial! @product
  json.rating @rate
  json.total_rating @count_rating
  json.messages Message.where(reference_type: 'Product', reference_id: @product.id) do |message|
    json.id message.id
    json.is_mine @user.id == message.user_id
    json.edited message.edited
    json.user_name message.user.full_name.split(' ')[0]
    json.message message.message
    json.rate message.rate
  end
end
