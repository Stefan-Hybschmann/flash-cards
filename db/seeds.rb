# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  puts 'Creating MindCard #' + i.to_s
  MindCard.create(title: "Title #{i}", text: "Text #{i}", context: "Context #{i}", active: true)
  puts 'MindCard #' + i.to_s + ' created'
end

puts 'Creating Packs'
p = Pack.new(title: 'Furniture', description: 'Furniture for your home', active: true)
p.save
p = Pack.new(title: 'Animals', description: 'Animals that live in the jungle', active: true)
p.save
p = Pack.new(title: 'Fish', description: 'Fish from the Atlantic Ocean', active: true)
p.save
p = Pack.new(title: 'Superheroes', description: 'Superheroes from the Marvel universe', active: true)
p.save
p = Pack.new(title: 'Weather', description: '20 most used phrases to describe the weather', active: true)
p.save
p = Pack.new(title: 'Numbers', description: 'Learn to count to 100', active: true)
p.save
p = Pack.new(title: 'Typical professions', description: 'Learn to ask where the nearest bakery or hairdressers is', active: true)
p.save
p = Pack.new(title: 'Present yourself', description: 'Sentences to use when describing yourself', active: true)
p.save
puts 'Packs created'
