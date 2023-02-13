require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
files = %w[https://images.unsplash.com/photo-1660949632684-3fdb4a515185?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80
  https://images.unsplash.com/photo-1660983366226-cf167690e167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1659038129553-1777827549de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1659644242353-0a8f3c3e9ecf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1584720175631-f9d3633a2e78?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80]

puts "Creating Users 🎈🌿"
5.times do |num|
  user = User.new(
    email: Faker::Internet.email,
    password: "123456"
  )
  file = URI.open(files[num])
  user.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
  user.save

end

shop = Shop.new(
  name: "tienda buhito",
  description: "descript shop1",
  address: "aaaaaaa"
)
shop.save
