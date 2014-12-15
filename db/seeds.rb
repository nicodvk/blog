# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(0..5).each do |i|
  Tag.create!(name: Faker::Lorem.word)
end

(0..10).each do |i|
  Post.create!(title:     Faker::Lorem.sentence,
               hat:       Faker::Lorem.paragraph,
               content:   Faker::Lorem.paragraph(rand(5)))
end