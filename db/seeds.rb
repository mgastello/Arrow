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
    Review.destroy_all
  
    puts "Resetting primary keys..."
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('products')
    ApplicationRecord.connection.reset_pk_sequence!('reviews')
  
    puts "Creating users..."
    User.create!(
        first_name: 'Demo', 
        last_name: 'User',
        email: 'demo@user.io', 
        password: 'password1'
    )

    10.times do
        User.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            password: 'password1'
        )
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

    puts "Creating reviews..."
    Review.create!(
        author_id: 1,
        product_id: 1,
        rating: 3,
        title: "Dog loves it and its safe. But not so tough.",
        body: "I bought this because of the Chew Guard Technology and it being labeled as TOUGH. I have a boxer puppy that loves to chew and can be tough on plush dog toys.
        The great news is the puppy seems to love it and I like that it doesn’t have stuffing and seems safe for her as she tears it up. But the bad news is she has already done
        substantial damage to it after one day.",
        display_name: "Kjrumz"
    )

    Review.create!(
        author_id: 4,
        product_id: 1,
        rating: 5,
        title: "Great toy!",
        body: "Great toy! My boys love it!",
        display_name: "Brenda"
    )

    Review.create!(
        author_id: 7,
        product_id: 1,
        rating: 1,
        title: "Not stuffed",
        body: "It isn’t a stuffed animal. It’s more like a flat dragon with some extra fabric.",
        display_name: "Annon"
    )

    Review.create!(
        author_id: 3,
        product_id: 1,
        rating: 5,
        title: "Pug loves it!",
        body: "My pug loves it! It’s not stuffed and is definitely on the smaller side but it’s perfect for a smaller breed dog.",
        display_name: "BH0308"
    )

    Review.create!(
        author_id: 5,
        product_id: 2,
        rating: 5,
        title: "Great TV",
        body: "I just dropped and broke this tv by accident but i absolutely LOVED IT!",
        display_name: "Kattcgr"
    )

    Review.create!(
        author_id: 3,
        product_id: 2,
        rating: 5,
        title: "Picture this great tv",
        body: "Great picture, greater value. Incredible picture. Zero complaints",
        display_name: "BigA"
    )

    Review.create!(
        author_id: 6,
        product_id: 2,
        rating: 4,
        title: "Pretty good",
        body: "Picture for the money is excellent. Lightweight. Attractive. Doesn’t like to stay connected to my router, Orbi mesh. Have to reboot every couple days.",
        display_name: "Grace"
    )

    Review.create!(
        author_id: 4,
        product_id: 2,
        rating: 1,
        title: "Annoyed feature or defect",
        body: "Unfortunately this new tv loses its sound periodically. I have to turn it off and wait a few minutes Usually when I turn it back on the sound will work
        for awhile. This is very annoying Otherwise I am pleased with the size and the pictures",
        display_name: "No sound"
    )

    Review.create!(
        author_id: 1,
        product_id: 2,
        rating: 4,
        title: "Amazing Game Enhancer, & Picture",
        body: "I've had her 2yrs now, & I have never been unhappy with her. If I ever scale up, it'll be another Samsung",
        display_name: "OG1stAce"
    )

    Review.create!(
        author_id: 8,
        product_id: 2,
        rating: 5,
        title: "Good image, wobbly feet",
        body: "Crisp, vivid image, easy plug and play functionality... but wobbly feet. The image quality if fantastic, as is the size- feels like the sweet spot for most
        living rooms. The smart-tv functionality is great, but absolutely no Plex functionality - you have to connect your phone or other device via bluetooth to run it. Minor
        annoyance, but an annoyance nonetheless. The 2 sets of feet are really wobbly. Painfully wobbly. This is the biggest downside to this otherwise great tv. Even on a very
        stable tv desk or furniture, your tv will move and sway with every bit of vibration in your room. If you are in a concrete floored room, you should be ok, but otherwise be aware.",
        display_name: "Johnny D"
    )

    Review.create!(
        author_id: 3,
        product_id: 2,
        rating: 2,
        title: "Would not recommend",
        body: "Very hard to watch any dark scenes. I ended up buying a Sony which is a great improvement.",
        display_name: "Jake245672"
    )

    Review.create!(
        author_id: 10,
        product_id: 2,
        rating: 3,
        title: "Middle Ground TV",
        body: "Pros: Great picture quality, wireless internet connection, great cost for a 55 inch tv. Cons: Sound is low (must turn volume up very high to hear), only 2 hdmi
        ports, menus have slow reaction times I purchased an extended 3 year warranty, so any issue hopefully will get taken care of..",
        display_name: "rockyb"
    )

    Review.create!(
        author_id: 5,
        product_id: 3,
        rating: 5,
        title: "iam baby",
        body: "i drank some and my tummy rumble!",
        display_name: "diaper baby"
    )

    Review.create!(
        author_id: 1,
        product_id: 3,
        rating: 5,
        title: "Best Detergent",
        body: "absolutely the best detergent",
        display_name: "foxy lady"
    )

    Review.create!(
        author_id: 4,
        product_id: 3,
        rating: 5,
        title: "Tide",
        body: "Best cleaning detergent on the market",
        display_name: "Audielaboo"
    )

    Review.create!(
        author_id: 5,
        product_id: 3,
        rating: 5,
        title: "Liquid laundry distergent",
        body: "Excellent for cleaning clothes. Does not make a mess and easy to dispense.",
        display_name: "Aloha4567"
    )

    Review.create!(
        author_id: 6,
        product_id: 3,
        rating: 1,
        title: "New scent is disgusting",
        body: "I thought something was wrong with my washing machine. This whole time the unpleasant smell was coming from this detergent. The scent smells
        hot, woody, and musty, and not in a good way.",
        display_name: "Lego Yoda"
    )

    Review.create!(
        author_id: 6,
        product_id: 4,
        rating: 5,
        title: "Airpod",
        body: "I love it I love it I love it",
        display_name: "Pro"
    )

    Review.create!(
        author_id: 8,
        product_id: 4,
        rating: 5,
        title: "Clear sound!",
        body: "I’ve always loved Apple AirPods, but these are even better than the first generation ones! I love these!!",
        display_name: "Shey13"
    )

    Review.create!(
        author_id: 7,
        product_id: 4,
        rating: 5,
        title: "Clear sound!",
        body: "10/10 highly recommend.",
        display_name: "Apple Watch Question"
    )

    Review.create!(
        author_id: 2,
        product_id: 4,
        rating: 5,
        title: "Apple Airpod Pros",
        body: "I gave them to my grandson for his birthday and he loves them! I wish Apple would make them the colors to match their phones then I would buy a set for everyone",
        display_name: "AirPods Pro"
    )

    Review.create!(
        author_id: 10,
        product_id: 4,
        rating: 5,
        title: "...I am OBSESSED with these!.",
        body: "I’ve always had a VERY hard time finding earbuds that fit my small ears, trust me I’ve tried many different brands & styles, but these are the BEST fitting/most
        comfortable earbuds I’ve ever had!! The medium size is PERFECT for me, which I was extremely surprised about! They’re very easy to pair with, I have the Apple ecosystem -
        every one of my devices (that has bluetooth) detects them immediately, so I never have to connect and disconnect them to any of my Apple products. I also LOVE that you have the
        ability to pick between transparency or noise cancellation - by the way, the noise cancellation is the by far the BEST I’ve ever encountered! It literally does block out all
        the background noise!! I was very hesitant about their capability, like I mentioned before I’ve used tons of headphones/earbuds that have had ‘noise canceling’ & they’re mediocre
        in comparison bc these are REAL deal! If you’re on the fence, I was as well (bc that price is steep), just get them! It’s the best gift I’ve splurged on for myself in a few years -
        so needless to say you won’t regret it. ..My husband tried them for not even half a song & he was sold, now he wants a pair as a gift LOL!",
        display_name: "jesca07"
    )

    Review.create!(
        author_id: 2,
        product_id: 5,
        rating: 5,
        title: "Great deal",
        body: "Fits perfectly, multi uses",
        display_name: "Satisfied"
    )

    Review.create!(
        author_id: 9,
        product_id: 5,
        rating: 1,
        title: "It broke before I built it.",
        body: "It's flimsy and the dowels are weak. It snapped apart while I built it.",
        display_name: "ash"
    )

    Review.create!(
        author_id: 4,
        product_id: 5,
        rating: 1,
        title: "Horrible",
        body: "The quality of items to put item together has changed. Very cheap and not sturdy. Highly disappointed since it broke in the middle if assembly",
        display_name: "iKeda"
    )

    Review.create!(
        author_id: 8,
        product_id: 5,
        rating: 4,
        title: "Works well",
        body: "Super easy to put together. I’ve put so many together I do t even need the instructions. Little flimsy but does why it’s supposed to.",
        display_name: "Madelinesny"
    )

    Review.create!(
        author_id: 7,
        product_id: 5,
        rating: 5,
        title: "Serves its purpose!",
        body: "It’s definitely made cheaply; however it’s worked great for my toddler’s playroom storage. We have them anchored to the wall and the cubes/shelves are holding up
        well. I went back and got 2 more for my closet and their closet. Love them!",
        display_name: "3theGibsonWay"
    )

    Review.create!(
        author_id: 10,
        product_id: 5,
        rating: 2,
        title: "So-So",
        body: "Very flimsy after putting together",
        display_name: "Jessica"
    )

    Review.create!(
        author_id: 10,
        product_id: 6,
        rating: 1,
        title: "Two out of five do not recommend",
        body: "Quite possibly the worst vacuum ever especially for the price. I received this as a Christmas gift in 2021. Immediately wanted to test it out because I love vacuuming
        and it started making a loud noise so I let it run for a bit and it stopped. That noise occasionally happens since my ownership ..my biggest issue with this vacuum is that it
        does not suck up dirt/trash properly it will fall back down each and every time I finish using it because of how the vacuum is made. It’s very odd. Today it is June 6, 2023
        and I am completely over the vacuum ..I tried to make it work this whole time but it’s time for a new one. It’s no longer sucking up. I keep the bristles clean, I take it
        apart and clean it out every so often, it’s just poorly made and defies gravity the way the trash gets sucked up into the bag less holder",
        display_name: "I love to vacuum"
    )

    Review.create!(
        author_id: 2,
        product_id: 6,
        rating: 5,
        title: "Great vaccum",
        body: "Light weight and very powerful. I also like the long cord. It enables me to plug in and almost do my entire 1st floor. I wanted a corded vac because my rechargeable
        is good but sometimes it runs out of power before I’m done cleaning. That’s what made me buy this model. I stand by Shark products.Excellent quality for the price.",
        display_name: "Broadway mama"
    )

    Review.create!(
        author_id: 7,
        product_id: 6,
        rating: 5,
        title: "DO IT",
        body: "THIS IS THE BOMB. Let me preface with the fact that I never leave reviews. But this was one of our first pricier purchases for our first home. I am a very clean person.
        I use my broom and dustpan every day, vacuumed with my old vaccum, and steam mopped. Clean floors are a must. When I used this for the first time, I had done all of that prior.
        I wasn't expecting to pull up as much as I did. Absolutely UNREAL. Attatchments provided will reach every single surface in your home. It is so lightweight and made my home look
        visibly cleaner which I didn't think was possible. BUY IT!!!!!",
        display_name: "linds"
    )

    Review.create!(
        author_id: 8,
        product_id: 6,
        rating: 1,
        title: "Not What I Expected",
        body: "I was disappointed in several things with this vacuum. I’m surprised it has such high ratings. It is so top heavy that you have to really have strength to balance
        while using. Also, it did not pick up popcorn on my hard floors and I have to lay it down on the floor if I need to stop vacuuming for a moment. It does not sit upright which
        is inconvenient. I’m returning and will spend a bit more for a more functional vacuum.",
        display_name: "Myster"
    )

    Review.create!(
        author_id: 9,
        product_id: 6,
        rating: 5,
        title: "Not What I Expected",
        body: "This is my first stick vac. I upgraded from a handheld rechargable Shark (dustbuster style) vac because we have hard floors and a broom generally does the trick. I
        really wanted a rechargable stick vac, but didn't want to pay that price tag and settled for this corded version. I have a short-haired dog who sheds quite a bit and this vac
        has really good suction. I like that I can get just about anywhere with the long handle and rather thin head. Our furniture has taller legs, so cleaning underneath it isn't a
        chore for me. The ONLY reason I would take off a half star and my only complaint is that the canister is attached to the cord. If you fill the canister up, you have to unplug
        the vac and bring/drag the cord with you to empty the canister if you aren't right near a trash can. Maybe all corded stick vacs are like that, I'm not sure being this is my
        first one. Just wanted to point that out for any other people new to these. I like that it's just a push button to open the canister to empty, and you can also wash/rinse out
        the unit rather easily.",
        display_name: "Upstater"
    )

    Review.create!(
        author_id: 9,
        product_id: 7,
        rating: 1,
        title: "Broke After 2 Uses",
        body: "The blender broke after 2 uses",
        display_name: "RW"
    )

    Review.create!(
        author_id: 8,
        product_id: 7,
        rating: 1,
        title: "I hate this blender with a burning passion",
        body: "it doesn't blend. the design is funky so that the blades push up everything that you try to blend. I dont recomend this if you want to make smoothies. I dont
        recomend this if you want to make smoothie bowls. once you get everything blended, it's runny. not good for smoothie bowls.",
        display_name: "Oster blender hater"
    )

    Review.create!(
        author_id: 7,
        product_id: 7,
        rating: 5,
        title: "Ok for soft items",
        body: "Cheap blender, works as expected. Add your liquids first and understand this is not a heavy duty, restaurant quality item.",
        display_name: "Best everyday shirt"
    )

    Review.create!(
        author_id: 6,
        product_id: 7,
        rating: 1,
        title: "Splurge for better",
        body: "After seeing the last several reviews with 1 star, I don’t know how this blender is still so highly recommended. It’s unsteady in the base, the lid doesn’t sit
        still (the energy generated inside causes it to keep lifting), all of it is plastic which really doesn’t make it feel secure/safe, and it’s loud. The only food I would trust
        to liquify in here is apple sauce or ice cream. Not even ice.",
        display_name: "Ali"
    )

    Review.create!(
        author_id: 5,
        product_id: 7,
        rating: 1,
        title: "Beware",
        body: "Do not buy this blender it’s the worse one ever broke after only using it for a 2 months",
        display_name: "Trish"
    )

    Review.create!(
        author_id: 4,
        product_id: 7,
        rating: 2,
        title: "Poor functioning top life and plastic middle piece",
        body: "The top is not solid, so the plastic top middle piece has fallen through two of these we have bought now and it gets chopped up in what we’re making and we will
        not buy this one ever again. The blender itself worked great.",
        display_name: "SE"
    )

    Review.create!(
        author_id: 4,
        product_id: 8,
        rating: 1,
        title: "Do Not Buy",
        body: "How are you supposed to get water out of here? I get a teaspoon full in my mouth and 1/2 of it is on my shirt. I’ve had bottles like this before, but never with this
        problem.",
        display_name: "Consumer"
    )

    Review.create!(
        author_id: 3,
        product_id: 8,
        rating: 5,
        title: "The Brita Water Bottle is ok.",
        body: "The Brita Water Bottle is ok to use. My old that I received as a gift 3 years ago still works like a charm.",
        display_name: "Alex C"
    )

    Review.create!(
        author_id: 2,
        product_id: 8,
        rating: 3,
        title: "Straw is no bueno",
        body: "Yes makes water taste great. But the straw is horrible. It feels like if you are sucking on a baby's bottle. Other than that, it's great.",
        display_name: "odessi"
    )

    Review.create!(
        author_id: 5,
        product_id: 8,
        rating: 2,
        title: "Top broke off",
        body: "I bought this a few months ago. I loved this water bottle... until the top broke off of it and it spills all over the place now. I was looking for replacement parts
        and I could find new straws and nozzle replacements but not the actual topper. Super upset I would have to buy a brand new bottle to keep using it. No thanks.",
        display_name: "Chellsbells"
    )

    Review.create!(
        author_id: 6,
        product_id: 8,
        rating: 5,
        title: "Great Water bottle",
        body: "I don’t have filtered water at home, so being able to just fill this up from the tap and have it filtered is awesome! It comes in such cute colors too!",
        display_name: "theronz"
    )

    Review.create!(
        author_id: 6,
        product_id: 8,
        rating: 5,
        title: "Great Water bottle",
        body: "I don’t have filtered water at home, so being able to just fill this up from the tap and have it filtered is awesome! It comes in such cute colors too!",
        display_name: "theronz"
    )
# end