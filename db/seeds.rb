require 'json'

a = File.read('db\brazil-cities-states.js')
a = JSON.parse(a)
i = 0;
c = 0;
puts "Populating Cities & States... It May take Some Time"
a['states'].count.times do
  a['states'][i]['cities'].count.times do
    City.create(uf:a['states'][i]['uf'],state_name:a['states'][i]['name'], name: a['states'][i]['cities'][c])
    c+=1
  end
  i+=1
  c = 0
end
puts "Population Done"
