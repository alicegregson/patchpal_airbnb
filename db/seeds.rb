# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
flat1 = Flat.create(name: 'Hoxton 100', location: 'Shoreditch', price_per_night: 345, capacity: 5, rating: 4)
flat2 = Flat.create(name: 'Bougie House', location: 'Shoreditch', price_per_night: 345, capacity: 5, rating: 4)
flat3 = Flat.create(name: "Jana's Cozy Coop", location: 'Shoreditch', price_per_night: 345, capacity: 5, rating: 4)
