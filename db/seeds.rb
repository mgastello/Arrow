# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ApplicationRecord.transaction do 

require "open-uri"

    puts "Destroying tables..."
    User.destroy_all
    Product.destroy_all
  
    puts "Resetting primary keys..."
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('products')
  
    puts "Creating users..."
    User.create!(
        first_name: 'Demo', 
        last_name: 'User',
        email: 'demo@user.io', 
        password: 'password1'
    )

    puts "Creating products..."
    toy = Product.create!(name: "TrustyPup Dragon Dog Toy - S/M", brand: "TrustyPup", price: 9.99, description: "TrustyPup® Dragons are whimsical,...")
    tv = Product.create!(name: "Samsung 65\" Smart 4K Crystal HDR UHD TV TU7000 Series", brand: "Samsung", price: 649.99, description: "This smart TV unlocks hidden...")
    tide = Product.create!(name: "Tide High Efficiency Liquid Laundry Detergent - Original", brand: "Tide", price: 12.99, description: "Tide's HE Turbo Clean detergents feature...")
    airpods = Product.create!(name: "Apple AirPods Pro (2nd Generation)", brand: "Apple", price: 249.99, description: "Up to 2x more Active Noise Cancellation...")
    hask = Product.create!(name: "Hask Curl Care Detangling Conditioner - 12 fl oz", brand: "Hask", price: 5.29, description: "HASK Curl Care Detangling Conditioner is enriched...")
    shelf = Product.create!(name: "11\" 6 Cube Organizer Shelf - Room Essentials™", brand: "Room Essentials", price: 35.00, description: "Give your traditional bookshelf a modern...")

    toy.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/dinotoy-picture.jpg"),
        filename: "dinotoy-picture.jpg"
    )

    tv.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/tv-picture.jpg"),
        filename: "tv-picture.jpg"
    )

    tide.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/tide-picture.jpg"),
        filename: "tide-picture.jpg"
    )

    airpods.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/airpods-picture.jpg"),
        filename: "airpods-picture.jpg"
    )

    hask.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/hask-picture.jpg"),
        filename: "hask-picture.jpg"
    )

    shelf.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/shelf-picture.jpg"),
        filename: "shelf-picture.jpg"
    )
# end