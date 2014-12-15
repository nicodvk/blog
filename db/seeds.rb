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

(0..5).each do |i|
  Comment.create!(content: Faker::Lorem.word, visible: 0)
end