# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
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
    beats = Product.create!(name: "Beats Studio3 Over-Ear Noise Canceling Bluetooth Wireless Headphones", brand: "Beats", price: 349.99, description: "Premium sound with fine-tuned...")
    beats = Product.create!(name: "Samsung 65\" Smart 4K Crystal HDR UHD TV TU7000 Series", brand: "Samsung", price: 649.99, description: "This smart TV unlocks hidden...")
    beats = Product.create!(name: "Tide High Efficiency Liquid Laundry Detergent - Original", brand: "Tide", price: 12.99, description: "Tide's HE Turbo Clean detergents feature")
end






