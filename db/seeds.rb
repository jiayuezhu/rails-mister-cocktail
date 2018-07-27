# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
require 'faker'

Cocktail.delete_all
puts "old cocktails deleted"

Dose.delete_all
puts "old doses deleted"

Ingredient.delete_all
puts "old ingredients deleted"

a = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
ingredient = JSON.parse(a)

15.times do
  Cocktail.create(name: Faker::Food.dish)
end
puts "5 cocktails created !"

50.times do
  Ingredient.create(name: ingredient["drinks"].sample["strIngredient1"])
end
puts "50 ingredients generated !"

Cocktail.all.each do |c|
  a = rand(1..5)
  a.times do
   Dose.create(description: Faker::Food.description,
               cocktail_id: c.id,
               ingredient_id: Ingredient.all.sample.id)
  end
end
puts "cocktail, dose and ingredients linked !"
puts "finished seeding !"

















