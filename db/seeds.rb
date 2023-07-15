# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# airports = Airport.create([{ code: 'SGN' }, { code: 'VCA' }, { code: 'DAD' }, { code: 'HPH' }, { code: 'HAN' }, { code: 'SGN' },
#                            { code: 'HUI' }, { code: 'CXR' }, { code: 'PQC' }, { code: 'VDO' }, { code: 'VII' }])

# 9.times do |i|
#   Route.create({airport_from_id: i+1, airport_to_id: i+2, duration: 60 + Random.rand(120)})
# end                           

# 25.times do |i|
#   Flight.create({route_id: 1 + Random.rand(10), departure_time: Time.now + 86400 + Random.rand(86400*7) })
# end

names = [{code: 'VCA', name:'Can Tho International Airport'},{code: 'DAD', name:'Da Nang International Airport'},{code: 'HPH', name:'Cat Bi International Airport'},{code: 'HAN', name:'Noi Bai International Airport'},{code: 'SGN', name:'Tan Son Nhat International Airport'},{code: 'HUI', name:'Phu Bai International Airport'},{code: 'CXR', name:'Cam Ranh International Airport'},{code: 'PQC', name:'Phu Quoc International Airport'},{code: 'VDO', name:'Van Don International Airport'},{code: 'VII', name:'Vinh International Airport'}]
names.each do |name|
  b = Airport.find_by_code(name[:code])
  b.name = name[:name]
  b.save
end
