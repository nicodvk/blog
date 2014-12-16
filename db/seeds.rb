# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create!( birthdate:              '1993-12-10',
                      country_code:           'France',
                      email:                  'admin@blog.fr',
                      firstname:              'admin',
                      lastname:               'nimda',
                      password:               'adminadmin',
                      password_confirmation:  'adminadmin',
                      phone:                  '0606060606',
                      street:                 '4, rue Jules Guesdes',
                      town:                   'Lille',
                      type:                   'Users::Admin',
                      created_at:             1.week.ago,
                      updated_at:             1.week.ago)

writer = User.create!( birthdate:          '1993-12-10',
                  country_code:           'France',
                  email:                  'writer@blog.fr',
                  firstname:              'writer',
                  lastname:               'retirw',
                  password:               'adminadmin',
                  password_confirmation:  'adminadmin',
                  phone:                  '0606060606',
                  street:                 '4, rue Jules Guesdes',
                  town:                   'Lille',
                  type:                   'Users::Writer',
                  created_at:             1.week.ago,
                  updated_at:             1.week.ago)

guest = User.create!( birthdate:      '1993-12-10',
              country_code:           'France',
              email:                  'guest@blog.fr',
              firstname:              'guest',
              lastname:               'tseug',
              password:               'adminadmin',
              password_confirmation:  'adminadmin',
              phone:                  '0606060606',
              street:                 '4, rue Jules Guesdes',
              town:                   'Lille',
              type:                   'Users::Guest',
              created_at:             1.week.ago,
              updated_at:             1.week.ago)

(0..8).each do |i|
  Tag.create!(name: "#{Faker::Lorem.word} #{Faker::Lorem.word}")
end

tags = Tag.all

(0..30).each do |i|
  Post.create!(
              title:     Faker::Lorem.sentence,
              hat:       Faker::Lorem.paragraph,
              content:   Faker::Lorem.paragraph(10),
              tags:      tags.shuffle.take(rand(8)),
              user:      writer,
              created:   Faker::Date.between(7.days.ago, Date.today),
              comments:  [
                            Comment.new(content: Faker::Lorem.sentence, visible: rand(0..1), user: guest, created: Faker::Date.between(7.days.ago, Date.today)),
                            Comment.new(content: Faker::Lorem.sentence, visible: rand(0..1), user: guest, created: Faker::Date.between(7.days.ago, Date.today)),
                            Comment.new(content: Faker::Lorem.sentence, visible: rand(0..1), user: guest, created: Faker::Date.between(7.days.ago, Date.today))
                          ],
              likes:      Array.new
              )
end
posts = Post.all
