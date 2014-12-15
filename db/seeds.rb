# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(0..8).each do |i|
  Tag.create!(name: Faker::Lorem.word)
end

tags = Tag.all

(0..30).each do |i|
  Post.create!(title:     Faker::Lorem.sentence,
               hat:       Faker::Lorem.paragraph,
               content:   Faker::Lorem.paragraph(10),
               tags:      tags.shuffle.take(rand(8)),
               created:   Faker::Date.between(7.days.ago, Date.today))
end