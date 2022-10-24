json.id client.id
json.uid client.uid
json.email client.email
json.completed client.completed
json.company_name client.company_name
json.short_name client.short_name
json.number client.number
json.mine client.user_id == @user.id ? true : false
json.logo client.logo.attached? ? polymorphic_url(client.logo) : false
json.open client.open
json.close client.close
json.company_relevance client.company_relevance
json.user_id client.user_id
json.description client.description
