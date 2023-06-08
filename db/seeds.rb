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

    10.times do
        5.times do
            first_name = Faker::Name.first_name
            last_name = Faker::Name.last_name
            email = Faker::Internet.email
        end
    end

    puts "Creating products..."
    toy = Product.create!(name: "TrustyPup Dragon Dog Toy - S/M", brand: "TrustyPup", price: 29.99, description: "TrustyPup® Dragons are whimsical, bright creatures 
    which are as tough as they are cute. Made with checkered plush and lined with Chew Guard Technology, these toys stand up to tough play. Minimal stuffing gives these 
    toys a fun \"floppy\" feel that dogs love! TrustyPup toys, beds and travel products are designed with the family in mind. We were the first major brand to bring human 
    grade, premium fill materials combined with Home Decor style and fabrics into pet bedding. Innovation, environmental concerns, your pet’s comfort, safety and enrichment 
    are top among our concerns. Our products are designed for a fun, healthy and engaged, stimulated and well rested pet. Testing to child safety standards and utilizing 
    environmentally friendly, sustainable materials wherever we can, drives us daily. Backed by our 100% satisfaction guarantee pet parents can rest easy with TrustyPup 
    products! Please read all packaging instructions, warnings and cautions upon receipt. Please read all packaging instructions, warnings and cautions upon receipt. 
    Packaging contains small parts, discard after opening.")

    tv = Product.create!(name: "Samsung 65\" Smart 4K Crystal HDR UHD TV TU7000 Series", brand: "Samsung", price: 1649.99, description: "This smart TV unlocks hidden 
    detail at four times the quality of Full HD. Plus, Universal Guide helps you find exactly what you want to watch, quickly and easily.The ultra-fast Crystal Processor 
    4K transforms everything you watch into stunning 4K. See what you’ve been missing on the crisp, clear picture that’s 4X the resolution of Full HD.")

    tide = Product.create!(name: "Tide High Efficiency Liquid Laundry Detergent - Original", brand: "Tide", price: 112.99, description: "Tide's HE Turbo Clean detergents 
    feature Smart Suds technology. The quick-collapsing suds clean faster and rinse out quicker, even in cold cycles.

    Tide HE laundry detergent keeps your whites white and your colors colorful with a refreshing scent, wash after wash.")
    airpods = Product.create!(name: "Apple AirPods Pro (2nd Generation)", brand: "Apple", price: 549.99, description: "AirPods Pro feature up to 2x more Active Noise 
    Cancellation, plus Adaptive Transparency, and Personalized Spatial Audio with dynamic head tracking for immersive sound. Now with multiple ear tips (XS, S, M, L) 
    and up to 6 hours of listening time.")

    shelf = Product.create!(name: "11\" 6 Cube Organizer Shelf - Room Essentials™", brand: "Room Essentials", price: 235.00, description: "Give your traditional bookshelf 
    a modern update with the 6 Cube Organizer Shelf from Room Essentials™. The cube openings are great for storage and compatible with 11\" storage bins. This item can 
    be displayed horizontally or vertically and is stackable in horizontal orientation. Perfect for organizing any room in the home. This cube organizer shelf comes with 
    all hardware included. To clean, wipe with a dry cloth.")

    vacuum = Product.create!(name: "Shark Rocket Ultra-Light Corded Stick Vacuum - HV301", brand: "Shark", price: 749.99, description: "This powerful ultra-lightweight 
    corded stick vacuum handles all floor types and easily converts into a handheld vacuum. It boasts nonstop corded performance for whole-home cleaning from floor to 
    ceiling. Swivel steering allows for excellent control in tight spaces and additional tools give you the ability to clean in tight spaces and tackle stubborn pet 
    hair. This vacuum comes with a crevice tool, upholstery tool and a dusting brush.")

    blender = Product.create!(name: "Oster Easy-to-Use 5 Speed Blender", brand: "Oster", price: 289.99, description: "Blend effortlessly with the Oster® Easy-to-Use 
    Blender. This Oster blender features a modern design and intuitive, easy-to-use push-button controls to help you make your favorite smoothies, snacks, frozen drinks, 
    salsas, and more. Experience 5-speed versatility including Blend, Mix, Chop, Ice Crush, and Pulse at the touch of a button.

    The 700-watt ice-crushing motor easily blends through ingredients, for power and performance you can depend on. When you're finished blending, the dishwasher-safe, 
    6-cup BPA-free jar makes cleanup an effortless task.
    
    Designed with an All-Metal Drive™ designed to last for up to 10,000 smoothies and Oster 3-Year Satisfaction Guarantee.
    
    For easier blending and effortless cleanup, get blending with the Oster Easy-to-Use Blender.")

    bottle = Product.create!(name: "Brita Water Bottle Plastic Water Bottle with Water Filter", brand: "Brita", price: 64.99, description: "Enjoy great tasting tap 
    water anywhere with the Brita 26 Ounce Premium Filtering Water Bottle. The durable BPA free plastic bottle includes 1 replaceable filter, which reduces Chlorine 
    (taste and odor) as you drink. Featuring an enclosed, easy sip straw, built in carrying loop for grab and go portability, and one handed push button lid, this bottle 
    is designed for effortless convenience. This water bottle is car cup holder friendly and has a leak proof design to help you avoid surprise drips and spills. One bottle 
    filter can replace up to 300 standard 16.9 ounce single use plastic bottles, so you can stay hydrated and reduce plastic waste. Switching to Brita, you can save money and 
    replace 1,800 single use plastic water bottles a year*. Brita filtering bottles are easy to clean and dishwasher safe. For best results, replace the filter every 40 gallons 
    or about every two months. *Six Brita Standard Filters can replace up to 1,800 16.9 oz single-use water bottles.")

    chair = Product.create!(name: "Sling Stacking Chair - Tan - Room Essentials™", brand: "Room Essentials", price: 119.99, description: "Sleek and stylish, the Sling Stacking 
    Chair from Room Essentials™ makes an elegant addition to your outdoor space. Set on a metal frame, this tan chair works well with most of your outdoor settings. It comes 
    complete with arms to help you sit in comfort whether you're reading a book in the garden or just enjoying a morning cup of tea in the backyard. Designed with rust and weather 
    resistance, this sling chair is great for outdoor use and boasts a stackable design for easy storage.")

    xbox = Product.create!(name: "Xbox Series X Console", brand: "Microsoft", price: 899.99, description: "Xbox Series X, the fastest, most powerful Xbox ever. Explore rich new 
    worlds with 12 teraflops of raw graphic processing power, DirectX ray tracing, a custom SSD, and 4K gaming. Make the most of every gaming minute with Quick Resume, 
    lightning-fast load times, and gameplay of up to 120 FPS—all powered by Xbox Velocity Architecture. Enjoy thousands of games from four generations of Xbox, with hundreds of 
    optimized titles that look and play better than ever. And when you add Xbox Game Pass Ultimate (membership sold separately), you get online multiplayer to play with friends 
    and an instant library of 100+ high-quality games, including day one releases from Xbox Game Studios like Halo Infinite, Forza Horizon 5, and Microsoft Flight Simulator.")

    bike = Product.create!(name: "Mongoose Scepter 24\" Mountain Bike - Green/Blue", brand: "Mongoose", price: 1229.99, description: "Take on steep slopes and tough trails with 
    confidence on the Scepter Mountain Bike from Mongoose. Made for experienced mountain bikers and new riders alike, this hardtail mountain bike is built with a durable steel 
    mountain frame and front suspension fork that are designed to take the abuse of bumps and dips found on dirt paths and trails. 21-speed twist shifters and the mountain bike 
    rear derailleur offer complete control over resistance and speed while traveling, giving you a wide gear range and letting you fine-tune your ride as you go. The Scepter 
    benefits from light and strong alloy rims that help lighten the load and knobby mountain tires that dig into dirt, sand or grass on your toughest rides. Slowing down to a halt, 
    even on a steep hill, is simple thanks to the linear pull brakes. Add in the steel 3-piece crank for superior gearing and there's only one choice for your next mountain ride.")

    lego = Product.create!(name: "LEGO Speed Champions 2 Fast 2 Furious Nissan Skyline GT-R (R34) 76917", brand: "LEGO", price: 149.99, description: "This buildable LEGO Speed 
    Champions Nissan Skyline GT-R (R34) replica model car building kit (76917) has been inspired by the iconic car from the explosive 2 Fast 2 Furious movie. Kids aged 9+, car 
    lovers and fans of the popular movie franchise can experience a rewarding build before proudly displaying this collectible toy car or recreating fast-paced street racing 
    scenes. This Fast & Furious race car model is packed with authentic details from the real-life car, including iconic livery wrap on the side, a wing at the back, a grille on 
    the front, impressive wheel arches and a nitro fuel canister on the passenger seat. There is also a Brian O’Conner minifigure to place in the driver’s seat so car fans can 
    enjoy all-action role play. Using the LEGO Builder app to zoom in, rotate and visualize the model, builders both young and old can bring their race car toy to life on a tablet 
    or smartphone, giving them a rewarding sense of achievement. LEGO Speed Champions give racing car fans the chance to recreate mini versions of the world’s leading and best-known 
    cars. Car enthusiasts and fans of the movies will love this LEGO Fast & Furious model car building kit as a birthday gift or special treat for kids aged 9 plus years old. 
    The model car measures over 2 in. (5 cm) high, 6.5 in. (16 cm) long and 2.5 in. (7 cm) wide. Contains 319 Pieces.")

    stroller = Product.create!(name: "Maxi-Cosi Siena CP 5-in-1 Modular Travel System", brand: "Maxi-Cosi", price: 1099.99, description: "The Maxi-Cosi Siena CP Modular Travel 
    System, featuring the Mico Luxe Infant Car Seat (included), is the perfect duo for all your strolling needs. From the relaxing and reclining newborn to upright and 
    world-facing toddler, your little one will enjoy exploring with you in a travel system designed for maximum comfort and protection. The lightweight Mico Luxe Infant Car Seat 
    is designed to attach to the stroller, giving parents the ease of transferring baby to and from the car. With 5 modes of use, the Siena CP system offers versatility, allowing 
    you to choose and switch between parent- and world-facing carriage, parent-facing infant car seat caddy, and both parent- and world-facing stroller.")

    soap = Product.create!(name: "Dial Pump Spring Water Liquid Hand Soap - 11 fl oz", brand: "Dial", price: 16.99, description: "Feel the sensation of an invigorating clean 
    with our Dial Spring Water Antibacterial Liquid Hand Soap. Find refreshment in a hand wash that removes dirt and bacteria while conditioning skin. Now you can get tough on dirt 
    and bacteria while being gentle on your hands. This Dial antibacterial hand soap kills 99.99% of bacteria found in your home, plus it’s mild enough for frequent use. Dial is 
    the number one doctor-recommended hand soap brand! Awaken your senses as you wash, with the natural and refreshing scent of spring water that’ll leave you with healthy feeling 
    skin, plus a scent the whole family will love. This package contains one 11 fl oz pump bottle of Dial Complete Antibacterial Liquid Hand Soap, Spring Water. How to use: 1. Pump 
    into hands 2. Lather vigorously in hands for at least 30 seconds 3. Rinse clean with water 4. Enjoy soft, healthy feeling hands.")

    fish_house = Product.create!(name: "Penn-Plax Spongebob Squarepants Licensed Aquarium Decor Krusty Krab", brand: "Penn-Plax", price: 74.99, description: "Add a little Bikini 
    Bottom from Nickelodeon's Spongebob Squarepants to your own aquarium with these great officially licensed decorative options form Penn-Plax. This resin Krusty Krab in your 
    tank will be a favorite spot for your fish and add a fun decor item for you to enjoy as well. Highly detailed and safe for freshwater or saltwater aquariums.")

    hangers = Product.create!(name: "10pk Flocked Hangers - Brightroom™", brand: "Brightroom", price: 36.99, description: "It's easy to organize a tidy closet with the help of 
    this 10-Pack of Flocked Hangers from Brightroom™. These versatile flocked hangers can keep tops, pants, dresses and more neatly organized in your closet while creating a tidy, 
    coordinated look. They come in a thin design to maximize your closet space, and feature a flocked velvet coating for a non-slip surface that helps keep garments from sliding 
    off. Just add storage bins below your hanging items for shoes and handbags to have a complete custom closet solution in no time.

    Brightroom™ started with a simple truth: When you’ve got it together, you feel better. Our versatile designs reveal the possibility in every closet, cupboard and drawer, and 
    work together to create brilliant ways to organize your every day.")

    ipad = Product.create!(name: "Apple iPad Pro 12.9-inch Wi‑Fi + Cellular 128GB - Space Gray", brand: "Apple", price: 3499.99, description: "iPad Pro. With astonishing 
    performance, superfast wireless connectivity, and next-generation Apple Pencil experience. Plus, powerful new productivity and collaboration features in iPadOS 16. iPad Pro 
    is the ultimate iPad.")

    pens = Product.create!(name: "Paper Mate Ink Joy 10pk Gel Pens 0.7mm Medium Tip Multicolored", brand: "Paper Mate", price: 43.99, description: "Spread joy (not smears) with 
    Paper Mate InkJoy Gel Pens. With vivid gel ink that dries 3X faster* for reduced smearing, it’s like a party on the page where smudges aren’t invited. Brilliant color ensures 
    your writing will be bright and filled with fun. Fully wrapped with a comfort grip, Paper Mate InkJoy pens have a smooth style that keeps the joy flowing as fast as your 
    thoughts.")

    plates = Product.create!(name: "12pc Stoneware Westfield Dinnerware Set - Threshold™", brand: "Threshold", price: 199.99, description: "The 12-Piece Stoneware Westfield 
    Dinnerware Set from Threshold™ makes the perfect choice to refresh your own dinnerware. This dinnerware set includes four bowls, four dinner plates and four salad plates, 
    all in a round shape to help complete your table setting. Made with stoneware in a glossy finish, this white dinnerware set brings elegant and modern appeal to your dining 
    room. Just add a white serving platter to create a coordinated look on the table for routine or occasional dining.")

    speaker = Product.create!(name: "JBL Flip 6 Waterproof Bluetooth Speaker", brand: "JBL", price: 449.99, description: "Your adventure. Your soundtrack. The bold JBL Flip 6 
    delivers powerful JBL Original Pro Sound with exceptional clarity thanks to its 2-way speaker system consisting of an optimized racetrack-shaped driver, separate tweeter, 
    and dual pumping bass radiators. This big-sounding, yet easy to carry speaker is waterproof and dustproof, so you can take it anywhere in any weather. And with 12 hours of 
    battery life, you can party 'til the sun goes down—or comes up—wherever the music moves you. Use PartyBoost to link multiple compatible speakers. The Flip 6 comes in a variety 
    of cool colors.")

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

    shelf.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/shelf-picture.jpg"),
        filename: "shelf-picture.jpg"
    )

    xbox.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/xbox.jpg"),
        filename: "xbox-picture.jpg"
    )

    speaker.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/speaker.jpg"),
        filename: "speaker-picture.jpg"
    )

    stroller.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/stroller.jpg"),
        filename: "stroller-picture.jpg"
    )

    vacuum.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/vacuum.jpg"),
        filename: "vacuum-picture.jpg"
    )

    plates.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/plates.jpg"),
        filename: "plates-picture.jpg"
    )

    soap.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/soap.jpg"),
        filename: "soap-picture.jpg"
    )

    lego.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/lego.jpg"),
        filename: "lego-picture.jpg"
    )

    pens.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/pens.jpg"),
        filename: "pens-picture.jpg"
    )

    ipad.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/ipad.jpg"),
        filename: "ipad-picture.jpg"
    )

    fish_house.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/fish_house.jpg"),
        filename: "fish_house-picture.jpg"
    )

    hangers.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/hangers.jpg"),
        filename: "hangers-picture.jpg"
    )

    chair.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/chair.jpg"),
        filename: "chair-picture.jpg"
    )

    blender.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/blender.jpg"),
        filename: "blender-picture.jpg"
    )

    bottle.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/bottle.jpg"),
        filename: "bottle-picture.jpg"
    )

    bike.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/bike.jpg"),
        filename: "bike-picture.jpg"
    )
# end