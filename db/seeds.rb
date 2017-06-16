# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sections = Section.all

sections.each do |section|
  10.times do |i|
    name = Faker::Food.ingredient
    puts "generate #{name} "
    food_item = FoodItem.create({ 
      name: name,
      section: section,
      description: Faker::Lorem.paragraph(5),
      price: Faker::Number.between(50, 200) * 1000,
      url: 'food/' + Faker::Number.between(1,12).to_s + '.jpeg'
    })
    food_item.save!
  end
end