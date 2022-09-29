json.cities @cities do |city|
  json.name "#{city.name} / #{city.uf}"
end
