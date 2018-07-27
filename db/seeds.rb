# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Creation de 3 villes
3.times do
  city = City.create(name: Faker::GameOfThrones.city)
end

# Creation de 15 Dogsitters
15.times do
  dogsitter = Dogsitter.create(name: Faker::GameOfThrones.character, city_id: City.all.sample.id)
end

# Creation de 45 Dogs
45.times do
  dog = Dog.create(name: Faker::Dog.name, city_id: City.all.sample.id)
end

# Boucle pour creation de 12 Strolls
City.all.each do |cityname|
  4.times do
    randomdog = Dog.all.sample
    randomsitter = Dogsitter.all.sample

    # Boucle pour trouver un chien provenant de la bonne ville
    while randomdog.city_id != cityname.id
      randomdog = Dog.all.sample
    end

    # Boucle pour trouver un dogsitter provenant de la bonne ville
    while randomsitter.city_id != cityname.id
      randomsitter = Dogsitter.all.sample
    end

    # Creation du stroll
    stroll = Stroll.create(name: Faker::Hobbit.location, city_id: cityname.id, dogsitter_id: randomsitter.id, dog_id: randomdog.id)
  end
end
