json.id user.id
json.full_name user.full_name
json.short_name "#{user.full_name&.split(' ')[0][0].upcase}#{user.full_name&.split(' ')[1][0].upcase}"
json.avatar user.avatar.attached? ? polymorphic_url(user.avatar) : ''
json.email user.email
json.address user.addresses do |address|
  json.id address.id
  json.street address.street
  json.number address.number
  json.complement address.complement
  json.district address.district
  json.city "#{address.city.name} / #{address.city.uf}"
end
