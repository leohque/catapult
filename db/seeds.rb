# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'


puts 'Cleaning database...'
ArtOrder.destroy_all
Art.destroy_all
Order.destroy_all
User.destroy_all

puts 'Creating users...'

3.times do
  user = User.new(
    username: Faker::Games::Pokemon.name,
    bio: Faker::Movies::HarryPotter.quote,
    weblink: "www.awebsite.com",
    email:    Faker::Internet.email,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    password: "123456",
    password_confirmation: "123456",
    latitude: rand(-90..90),
    longitude: rand(-180..80)
  )
  user.save!

  5.times do
    art = Art.new(
      name: Faker::Games::Pokemon.name,
      description: Faker::Lorem.paragraph,
      category: "statue",
      price: Faker::Number.within(range: 100..1000),
      quantity: Faker::Number.within(range: 1..10),
      user: user
    )
    file = URI.open('https://img.olx.com.br/thumbs256x256/85/858930021988067.jpg')
    art.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    art.save!
  end

  5.times do
    order = Order.new(
    user: user,
    status: Order::STATUS.sample) # syntax :: is for calling constant variables (eg: STATUS)
    order.save!
  end

end


# orders = Order.all
# arts = Art.all
# puts "Creating art_orders"
# 20.times do
#   art_order = ArtOrder.new(
#     art: arts.sample,
#     order: orders.sample,
#     price: rand(10..100)
#     )
#   art_order.save!
# end

puts 'Finished!'
