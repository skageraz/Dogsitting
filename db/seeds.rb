# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  City.create(
    name: Faker::Address.city
    )
  Dogsitter.create(
    name: Faker::Name.first_name,
    city_id: rand(City.first.id..City.last.id)

   )
   Dog.create(
     name: Faker::Dog.name,
     city_id: rand(City.first.id..City.last.id)

    )
  Stroll.create(
    name: Faker::Address.street_name,
    city_id: rand(City.first.id..City.last.id),
    dog_id: rand(Dog.first.id..Dog.last.id),
    dogsitter_id: rand(Dogsitter.first.id..Dogsitter.last.id)

  )




  end
