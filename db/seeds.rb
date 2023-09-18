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
    Packaging contains small parts, discard after opening.", department: "toys")

    tv = Product.create!(name: "Samsung 65\" Smart 4K Crystal HDR UHD TV TU7000 Series", brand: "Samsung", price: 1649.99, description: "This smart TV unlocks hidden 
    detail at four times the quality of Full HD. Plus, Universal Guide helps you find exactly what you want to watch, quickly and easily.The ultra-fast Crystal Processor 
    4K transforms everything you watch into stunning 4K. See what you’ve been missing on the crisp, clear picture that’s 4X the resolution of Full HD.", department: "electronics")

    tide = Product.create!(name: "Tide High Efficiency Liquid Laundry Detergent - Original", brand: "Tide", price: 112.99, description: "Tide's HE Turbo Clean detergents 
    feature Smart Suds technology. The quick-collapsing suds clean faster and rinse out quicker, even in cold cycles.

    Tide HE laundry detergent keeps your whites white and your colors colorful with a refreshing scent, wash after wash.", department: "household essentials")

    airpods = Product.create!(name: "Apple AirPods Pro (2nd Generation)", brand: "Apple", price: 549.99, description: "AirPods Pro feature up to 2x more Active Noise 
    Cancellation, plus Adaptive Transparency, and Personalized Spatial Audio with dynamic head tracking for immersive sound. Now with multiple ear tips (XS, S, M, L) 
    and up to 6 hours of listening time.", department: "apple, electronics")

    shelf = Product.create!(name: "11\" 6 Cube Organizer Shelf - Room Essentials™", brand: "Room Essentials", price: 235.00, description: "Give your traditional bookshelf 
    a modern update with the 6 Cube Organizer Shelf from Room Essentials™. The cube openings are great for storage and compatible with 11\" storage bins. This item can 
    be displayed horizontally or vertically and is stackable in horizontal orientation. Perfect for organizing any room in the home. This cube organizer shelf comes with 
    all hardware included. To clean, wipe with a dry cloth.", department: "furniture")

    vacuum = Product.create!(name: "Shark Rocket Ultra-Light Corded Stick Vacuum - HV301", brand: "Shark", price: 749.99, description: "This powerful ultra-lightweight 
    corded stick vacuum handles all floor types and easily converts into a handheld vacuum. It boasts nonstop corded performance for whole-home cleaning from floor to 
    ceiling. Swivel steering allows for excellent control in tight spaces and additional tools give you the ability to clean in tight spaces and tackle stubborn pet 
    hair. This vacuum comes with a crevice tool, upholstery tool and a dusting brush.", department: "household essentials")

    blender = Product.create!(name: "Oster Easy-to-Use 5 Speed Blender", brand: "Oster", price: 289.99, description: "Blend effortlessly with the Oster® Easy-to-Use 
    Blender. This Oster blender features a modern design and intuitive, easy-to-use push-button controls to help you make your favorite smoothies, snacks, frozen drinks, 
    salsas, and more. Experience 5-speed versatility including Blend, Mix, Chop, Ice Crush, and Pulse at the touch of a button.

    The 700-watt ice-crushing motor easily blends through ingredients, for power and performance you can depend on. When you're finished blending, the dishwasher-safe, 
    6-cup BPA-free jar makes cleanup an effortless task.
    
    Designed with an All-Metal Drive™ designed to last for up to 10,000 smoothies and Oster 3-Year Satisfaction Guarantee.
    
    For easier blending and effortless cleanup, get blending with the Oster Easy-to-Use Blender.", department: "kitchen dining")

    bottle = Product.create!(name: "Brita Water Bottle Plastic Water Bottle with Water Filter", brand: "Brita", price: 64.99, description: "Enjoy great tasting tap 
    water anywhere with the Brita 26 Ounce Premium Filtering Water Bottle. The durable BPA free plastic bottle includes 1 replaceable filter, which reduces Chlorine 
    (taste and odor) as you drink. Featuring an enclosed, easy sip straw, built in carrying loop for grab and go portability, and one handed push button lid, this bottle 
    is designed for effortless convenience. This water bottle is car cup holder friendly and has a leak proof design to help you avoid surprise drips and spills. One bottle 
    filter can replace up to 300 standard 16.9 ounce single use plastic bottles, so you can stay hydrated and reduce plastic waste. Switching to Brita, you can save money and 
    replace 1,800 single use plastic water bottles a year*. Brita filtering bottles are easy to clean and dishwasher safe. For best results, replace the filter every 40 gallons 
    or about every two months. *Six Brita Standard Filters can replace up to 1,800 16.9 oz single-use water bottles.", department: "sports outdoors")

    chair = Product.create!(name: "Sling Stacking Chair - Tan - Room Essentials™", brand: "Room Essentials", price: 119.99, description: "Sleek and stylish, the Sling Stacking 
    Chair from Room Essentials™ makes an elegant addition to your outdoor space. Set on a metal frame, this tan chair works well with most of your outdoor settings. It comes 
    complete with arms to help you sit in comfort whether you're reading a book in the garden or just enjoying a morning cup of tea in the backyard. Designed with rust and weather 
    resistance, this sling chair is great for outdoor use and boasts a stackable design for easy storage.", department: "furniture")

    xbox = Product.create!(name: "Xbox Series X Console", brand: "Microsoft", price: 899.99, description: "Xbox Series X, the fastest, most powerful Xbox ever. Explore rich new 
    worlds with 12 teraflops of raw graphic processing power, DirectX ray tracing, a custom SSD, and 4K gaming. Make the most of every gaming minute with Quick Resume, 
    lightning-fast load times, and gameplay of up to 120 FPS—all powered by Xbox Velocity Architecture. Enjoy thousands of games from four generations of Xbox, with hundreds of 
    optimized titles that look and play better than ever. And when you add Xbox Game Pass Ultimate (membership sold separately), you get online multiplayer to play with friends 
    and an instant library of 100+ high-quality games, including day one releases from Xbox Game Studios like Halo Infinite, Forza Horizon 5, and Microsoft Flight Simulator.",
    department: "video games, electronics")

    bike = Product.create!(name: "Mongoose Scepter 24\" Mountain Bike - Green/Blue", brand: "Mongoose", price: 1229.99, description: "Take on steep slopes and tough trails with 
    confidence on the Scepter Mountain Bike from Mongoose. Made for experienced mountain bikers and new riders alike, this hardtail mountain bike is built with a durable steel 
    mountain frame and front suspension fork that are designed to take the abuse of bumps and dips found on dirt paths and trails. 21-speed twist shifters and the mountain bike 
    rear derailleur offer complete control over resistance and speed while traveling, giving you a wide gear range and letting you fine-tune your ride as you go. The Scepter 
    benefits from light and strong alloy rims that help lighten the load and knobby mountain tires that dig into dirt, sand or grass on your toughest rides. Slowing down to a halt, 
    even on a steep hill, is simple thanks to the linear pull brakes. Add in the steel 3-piece crank for superior gearing and there's only one choice for your next mountain ride.",
    department: "sports outdoors")

    lego = Product.create!(name: "LEGO Speed Champions 2 Fast 2 Furious Nissan Skyline GT-R (R34) 76917", brand: "LEGO", price: 149.99, description: "This buildable LEGO Speed 
    Champions Nissan Skyline GT-R (R34) replica model car building kit (76917) has been inspired by the iconic car from the explosive 2 Fast 2 Furious movie. Kids aged 9+, car 
    lovers and fans of the popular movie franchise can experience a rewarding build before proudly displaying this collectible toy car or recreating fast-paced street racing 
    scenes. This Fast & Furious race car model is packed with authentic details from the real-life car, including iconic livery wrap on the side, a wing at the back, a grille on 
    the front, impressive wheel arches and a nitro fuel canister on the passenger seat. There is also a Brian O’Conner minifigure to place in the driver’s seat so car fans can 
    enjoy all-action role play. Using the LEGO Builder app to zoom in, rotate and visualize the model, builders both young and old can bring their race car toy to life on a tablet 
    or smartphone, giving them a rewarding sense of achievement. LEGO Speed Champions give racing car fans the chance to recreate mini versions of the world’s leading and best-known 
    cars. Car enthusiasts and fans of the movies will love this LEGO Fast & Furious model car building kit as a birthday gift or special treat for kids aged 9 plus years old. 
    The model car measures over 2 in. (5 cm) high, 6.5 in. (16 cm) long and 2.5 in. (7 cm) wide. Contains 319 Pieces.", department: "toys")

    stroller = Product.create!(name: "Maxi-Cosi Siena CP 5-in-1 Modular Travel System", brand: "Maxi-Cosi", price: 1099.99, description: "The Maxi-Cosi Siena CP Modular Travel 
    System, featuring the Mico Luxe Infant Car Seat (included), is the perfect duo for all your strolling needs. From the relaxing and reclining newborn to upright and 
    world-facing toddler, your little one will enjoy exploring with you in a travel system designed for maximum comfort and protection. The lightweight Mico Luxe Infant Car Seat 
    is designed to attach to the stroller, giving parents the ease of transferring baby to and from the car. With 5 modes of use, the Siena CP system offers versatility, allowing 
    you to choose and switch between parent- and world-facing carriage, parent-facing infant car seat caddy, and both parent- and world-facing stroller.", department: "baby")

    soap = Product.create!(name: "Dial Pump Spring Water Liquid Hand Soap - 11 fl oz", brand: "Dial", price: 16.99, description: "Feel the sensation of an invigorating clean 
    with our Dial Spring Water Antibacterial Liquid Hand Soap. Find refreshment in a hand wash that removes dirt and bacteria while conditioning skin. Now you can get tough on dirt 
    and bacteria while being gentle on your hands. This Dial antibacterial hand soap kills 99.99% of bacteria found in your home, plus it’s mild enough for frequent use. Dial is 
    the number one doctor-recommended hand soap brand! Awaken your senses as you wash, with the natural and refreshing scent of spring water that’ll leave you with healthy feeling 
    skin, plus a scent the whole family will love. This package contains one 11 fl oz pump bottle of Dial Complete Antibacterial Liquid Hand Soap, Spring Water. How to use: 1. Pump 
    into hands 2. Lather vigorously in hands for at least 30 seconds 3. Rinse clean with water 4. Enjoy soft, healthy feeling hands.", department: "household essentials")

    fish_house = Product.create!(name: "Penn-Plax Spongebob Squarepants Licensed Aquarium Decor Krusty Krab", brand: "Penn-Plax", price: 74.99, description: "Add a little Bikini 
    Bottom from Nickelodeon's Spongebob Squarepants to your own aquarium with these great officially licensed decorative options form Penn-Plax. This resin Krusty Krab in your 
    tank will be a favorite spot for your fish and add a fun decor item for you to enjoy as well. Highly detailed and safe for freshwater or saltwater aquariums.", department: "pets")

    hangers = Product.create!(name: "10pk Flocked Hangers - Brightroom™", brand: "Brightroom", price: 36.99, description: "It's easy to organize a tidy closet with the help of 
    this 10-Pack of Flocked Hangers from Brightroom™. These versatile flocked hangers can keep tops, pants, dresses and more neatly organized in your closet while creating a tidy, 
    coordinated look. They come in a thin design to maximize your closet space, and feature a flocked velvet coating for a non-slip surface that helps keep garments from sliding 
    off. Just add storage bins below your hanging items for shoes and handbags to have a complete custom closet solution in no time.

    Brightroom™ started with a simple truth: When you’ve got it together, you feel better. Our versatile designs reveal the possibility in every closet, cupboard and drawer, and 
    work together to create brilliant ways to organize your every day.", department: "household essentials")

    ipad = Product.create!(name: "Apple iPad Pro 12.9-inch Wi‑Fi + Cellular 128GB - Space Gray", brand: "Apple", price: 3499.99, description: "iPad Pro. With astonishing 
    performance, superfast wireless connectivity, and next-generation Apple Pencil experience. Plus, powerful new productivity and collaboration features in iPadOS 16. iPad Pro 
    is the ultimate iPad.", department: "apple, electronics")

    pens = Product.create!(name: "Paper Mate Ink Joy 10pk Gel Pens 0.7mm Medium Tip Multicolored", brand: "Paper Mate", price: 43.99, description: "Spread joy (not smears) with 
    Paper Mate InkJoy Gel Pens. With vivid gel ink that dries 3X faster* for reduced smearing, it’s like a party on the page where smudges aren’t invited. Brilliant color ensures 
    your writing will be bright and filled with fun. Fully wrapped with a comfort grip, Paper Mate InkJoy pens have a smooth style that keeps the joy flowing as fast as your 
    thoughts.", department: "school office")

    plates = Product.create!(name: "12pc Stoneware Westfield Dinnerware Set - Threshold™", brand: "Threshold", price: 199.99, description: "The 12-Piece Stoneware Westfield 
    Dinnerware Set from Threshold™ makes the perfect choice to refresh your own dinnerware. This dinnerware set includes four bowls, four dinner plates and four salad plates, 
    all in a round shape to help complete your table setting. Made with stoneware in a glossy finish, this white dinnerware set brings elegant and modern appeal to your dining 
    room. Just add a white serving platter to create a coordinated look on the table for routine or occasional dining.", department: "kitchen dining")

    speaker = Product.create!(name: "JBL Flip 6 Waterproof Bluetooth Speaker", brand: "JBL", price: 449.99, description: "Your adventure. Your soundtrack. The bold JBL Flip 6 
    delivers powerful JBL Original Pro Sound with exceptional clarity thanks to its 2-way speaker system consisting of an optimized racetrack-shaped driver, separate tweeter, 
    and dual pumping bass radiators. This big-sounding, yet easy to carry speaker is waterproof and dustproof, so you can take it anywhere in any weather. And with 12 hours of 
    battery life, you can party 'til the sun goes down—or comes up—wherever the music moves you. Use PartyBoost to link multiple compatible speakers. The Flip 6 comes in a variety 
    of cool colors.", department: "electronics")

    mechanical_pencils = Product.create!(name: "40pk #2 Mechanical Pencils - BIC", brand: "BIC", price: 49.99, description: "BIC® Xtra Smooth Mechanical Pencil is the #1 selling
    mechanical pencil. This special limited Bright Edition pack features fun barrels in an array of bright colors. The smooth, dark writing lead does not smudge and erases cleanly,
    and the lead advances quickly and easily! Always ready, sharp and accurate, this pencil is perfect for standardized tests. Pack of 40.
    Source: The NPD Group/ Retail Tracking Service / U.S. Actual Unit Sales (Retail & Commercial Combined)/ Jan - Dec 2018", department: "school office")

    expo = Product.create!(name: "Expo 4pk Dry Erase Markers Chisel Tip Black", brand: "Expo", price: 29.99, description: "Expo Low Odor Dry Erase Markers feature bold ink that's easy
    to see from a distance and provides consistent color quality. These Expo dry erase markers erase cleanly and easily from whiteboards and other nonporous surfaces with a dry cloth or
    Expo eraser. The dry erase marker ink is specially formulated to be low-odor making it perfect for use in classrooms, offices and homes. Use your black Expo dry erase markers to
    track, schedule, and present.", department: "school office")

    markers = Product.create!(name: "Crayola 10ct Washable Broad Line Markers - Classic Colors", brand: "Crayola", price: 89.99, description: "Bring home this set of 10 Ultra Clean
    Washable Markers in classic colors. Perfect for art projects, crafts, and homework assignments, these broad line markers are essential coloring supplies for school and home. Crayola
    is dedicated to helping kids of all ages unleash the power of imagination in colorful ways. That's why they developed ColorMax - a variety of innovations to reinvigorate classic
    Crayola products with the highest quality colors available today. Each of these kids markers washes from skin, most washable clothing, and painted walls, and that's why parents and
    kids love them. Ideal for ages 3 and up.", department: "school office")

    colored_pencils = Product.create!(name: "Crayola 12ct Kids Pre-Sharpened Colored Pencils", brand: "Crayola", price: 69.99, description: "Crayola Colored Pencils are ready for use
    right out of the box! An essential art tool, these pencils feature bold colors and pre-sharpened tips. Designed for durability, they are sure to last through many coloring book
    pages, creative projects, and homework assignments. Featured colors include Red, Red Orange, Orange, Yellow, Yellow Green, Green, Sky Blue, Blue, Purple, Black, Brown, and White.
    The reusable storage box makes it easy to take these colored pencils wherever you go. Stock up classrooms and craft rooms with these colorful essentials. Safe and nontoxic, this
    colored pencil set is ideal for ages 5 and up.", department: "school office")

    glue_stick = Product.create!(name: "Elmer's 12pk Washable School Glue Sticks - Disappearing Purple", brand: "Elmer's", price: 59.99, description: "Get smooth, clump-free results at
    home, school, or on the go with Elmer’s Washable Disappearing Purple School Glue Sticks. Great for kids, the washable formula is purple when first applied, so it's easy to see, and
    then it dries clear for easy bonding and great results. It goes on evenly and dries quickly for hassle-free bonding, helping save you time and reduce mess. Ideal for school projects
    and home crafts, these glue sticks offer a fun way to attach items to paper, display board, cardboard, foam board, photos, and much more. This glue is safe, non-toxic, and
    acid-free.", department: "school office")

    ticonderoga = Product.create!(name: "Ticonderoga #2 Pre-Sharpened Pencil, 18ct", brand: "Ticonderoga", price: 99.99, description: "Ticonderoga® has a tradition of fine quality
    writing instruments for over 100 years. The exclusive graphite core features a proprietary formula focusing on graphite mined from carefully controlled sources to deliver extra
    smooth performance. Top-quality latex-free erasers remove marks completely without smudging. Premium wood harvested from responsibly managed sources provides smooth, even sharpening
    with minimal breakage. These pencils are pre-sharpened to save you time and hassle. Teachers prefer Ticonderoga® for its dependability and craftmanship. When only the best will do,
    choose Ticonderoga® brand pencils.", department: "school office")

    paper = Product.create!(name: "175 Sheet Wide Ruled Filler Paper White - Top Flight", brand: "Top Flight", price: 39.99, description: "Top Flight Wide Ruled Filler Paper is perfect
    for your school needs.", department: "school office")

    folder = Product.create!(name: "2 Pocket Plastic Folder with Prongs - up & up™", brand: "up & up", price: 22.49, description: "Easily organize important papers and documents in this
    Two-Pocket Plastic Folder with Prongs from up & up™. This plastic file folder has two pockets to keep your documents, test papers, medical prescriptions or any other bills or receipts
    in a well-organized manner. The file folder comes with prong fasteners to keep your documents intact, making it perfect for home, school or the office.", department: "school office")

    glue = Product.create!(name: "Elmer's 4oz Washable School Glue - White", brand: "Elmer's", price: 15.99, description: "Attach items to paper, wood, cloth, pottery, and more with the
    non-toxic adhesive of Elmer's Washable School Glue. Specially formulated to be washable and easy to use, Elmer's School Glue perfect for school projects and home arts and crafts.
    Elmer’s School Glue is adjustable before setting and does not run, delivering reliable results with every use. You can also use your liquid glue to create glue slime!",
    department: "school office")

    ruler = Product.create!(name: "12\" Wood Ruler - up & up™", brand: "up & up", price: 12.99, description: "Keep this 12\" Wood Ruler from up & up™ with your math binder by hooking in
    one of the handily punched holes. Made of wood, this ruler features a pencil groove and straight edge for all your measuring needs. Also useful around the home or office, the ruler
    features markings in both inches and centimeters.", department: "school office")

    binder = Product.create!(name: "1\" 3 Ring Binder Clear View - up & up™", brand: "up & up", price: 19.99, description: "Keep it all together with the Clear View Durable Ring Binder
    from up & up™ This smartly designed D-ring binder can hold more pages than a traditional round ring binder, giving you more room to store and organize your important documents. In
    addition to the center storage you expect from a ring binder, internal pockets let you store other objects that just don't lend themselves to hole punches.",
    department: "school office")

    baby_dove = Product.create!(name: "Baby Dove Rich Moisture Sensitive Skin Hypoallergenic Wash - 20 fl oz", brand: "Baby Dove", price: 39.99, description: "Baby bath time is special.
    And with baby skin being 30% thinner than ours, the best care is the gentlest. To help protect your little one’s delicate skin, we created Baby Dove Rich Moisture Hypoallergenic
    Baby Wash to help nourish and replenish your little one’s delicate skin during bath time.

    This tear-free and hypoallergenic baby wash for skin and hair ensures bath time is all about smiles, not tears. Made with 100% skin-natural nutrients, which are identical to those
    naturally found in skin, and prebiotic moisture to help replenish the essential moisture and nutrients that baby’s skin can lose during bath time. To use this baby wash, gently wet
    baby’s hair and skin with warm water, work into a lather, and rinse for touchably soft skin. This gentle wash is pediatrician recommended and dermatologist tested, and our caring
    formulas are created without dyes, parabens, phthalates or sulfates, so you can feel assured that this baby wash gives baby’s skin the complete care it needs.
    
    We know there’s no right or wrong way to be a parent – only your way. That’s why Baby Dove is here to help give you confidence that you’re providing the best skin care for your
    baby's skin. Our Tip to Toe Wash is sold in 6.5 oz., 13 oz., and 20 oz. bottles. Looking for something for your baby’s extra sensitive skin? Look for Baby Dove Fragrance Free Moisture
    Hypoallergenic Wash. Packaging contains recycled content - Bottle is made from 100% post-consumer recycled content (PCR)", department: "baby")

    huggies = Product.create!(name: "Huggies Little Snugglers Baby Diapers", brand: "Huggies", price: 139.99, description: "Made with your baby's sensitive skin in mind, Huggies Little
    Snugglers Baby Diapers offer gentle skin protection that helps keep your baby’s skin comfortable and healthy. These baby diapers provide up to 12 hours of leak protection and are
    made with a curved and stretchy fit that delivers all-around comfort for a gentle tummy fit. A soft, back pocketed waistband helps prevent leaks and blowouts while helping keep mess
    away from your baby's skin. These disposable baby diapers are also made with Huggies' GentleAbsorb Liner that absorbs wetness on contact, helping keep your baby’s skin clean and
    healthy. Extra soft materials provide belly comfort and protection from red marks during Tummy Time. Safe for sensitive skin, these disposable baby diapers are hypoallergenic and
    dermatologist tested. Plus, they're fragrance free, paraben free, as well as made without lotions, elemental chlorine and natural rubber latex. Sizes 2-6 come with Double Grip Strips
    provide flexibility and help keep the diaper in place, even when your baby is moving. Join Huggies Rewards+ powered by Fetch to get rewarded. Earn points on Huggies diapers and wipes,
    in addition to thousands of other products to redeem for hundreds of gift cards. Download the Fetch Rewards app to get started today!", department: "baby")

    baby_wash = Product.create!(name: "SheaMoisture Baby Wash & Shampoo Raw Shea + Chamomile + Argan Oil Calm & Comfort for All Skin Types - 13 fl oz", brand: "SheaMoisture",
    price: 49.99, description: "Let SheaMoisture help you in taking care of your baby's skin and hair with our Raw Shea Chamomile & Argan Oil Baby Wash and Shampoo. This sulfate-free
    baby wash and shampoo, specially blended with Chamomile, Argan Oil, and Fair Trade Shea Butter, helps keeps baby's delicate skin soft and smooth. This baby wash and baby shampoo acts
    as a gentle cleanser and moisturizer that is infused with frankincense and myrrh. At SheaMoisture, we are aware of how delicate baby skin is, which is why our baby shampoo and bath
    products are formulated with this in mind. Our baby wash and shampoo, blended with chamomile and argan oil, is formulated with no parabens, no phthalates, no mineral oil and no
    sulfates so that it is gentle on delicate skin. SheaMoisture baby wash and baby shampoo is cruelty-free, and sustainably produced as we strive to leave our planet a better place for
    our children. SheaMoisture's Story: SheaMoisture is the legacy of Sofi Tucker, a pioneering mother of four and an entrepreneur, who sold Shea Butter, African Black Soap and homemade
    beauty preparations in Sierra Leone in 1912. We honor her vision by continuing to formulate with Raw Shea Butter handcrafted by women in Africa. With every purchase you show support
    of our mission to reinvest back in our communities.", department: "baby")

    avent = Product.create!(name: "Philips Avent 3pk Natural Baby Bottle with Natural Response Nipple - Clear - 9oz", brand: "Avent", price: 69.99, description: "Philips Avent Natural
    bottle with the Natural Response nipple lets baby control the pace of the milk, like they do when breastfeeding. The nipples' unique opening and tip only releases milk when your baby
    actively drinks. When pausing to swallow and breathe no milk flows. Baby can drink, swallow, and breathe using their natural rhythm, just like they do when breastfeeding. Easily
    combine breast and bottle feeding with a wide breast-shaped nipple with a soft feel that mimics the shape and feel of a breast; plus baby controlling the flow of milk like
    they do when breastfeeding. The nipple has a no-drip design which helps prevent lost milk from the tip. An anti-colic valve integrated into the nipple is designed to reduce
    colic and discomfort by sending air away from your baby's tummy. The ergonomic shape makes it comfortable for parents to hold and easy for small fingers to grasp. Assembly is simple
    with only a few parts and the wide bottle neck makes filling and cleaning easy. The Natural bottle is made from polypropylene, a BPA free material, and works with all nipples and
    caps from the Natural line. The Natural response nipples come in flow rates 1-5, to keep up with your baby's growth. Includes: 3 9oz Natural bottles with Natural Response nipples,
    flow 3. SCY903/93

    What to expect when introducing the Philips Avent Natural Response Nipple:
        
    -It's totally natural for your baby to take 2-3 tries to get milk flowing from a new bottle. Unlike traditional bottles the Natural bottle is designed to only release milk when your
    baby is actively drinking, like what happens when babies breastfeed.
        
    -We have 5 different nipple flow rates for the Natural bottle. When looking for the right nipple flow rate, age is a guide, but your baby's approach to drinking and the feeding cues
    they will show will help determine when to move to a higher or lower nipple flow rate.", department: "baby")

    baby_towel = Product.create!(name: "Baby Elephant Hooded Towel - Cloud Island™ Gray", brand: "Cloud Island", price: 24.99, description: "Keep your baby dry and warm between the end
    of bathtime and getting cozied up in their jammies with this Elephant Hooded Towel from cloud island™. This cotton bath towel has a soft touch against baby’s delicate skin to keep
    them comfy-cozy after they get out of the water. It comes complete with terry construction that absorbs moisture quickly, along with an adorable elephant face on the hood that helps
    dry their head quickly and adds a dash of cuteness as well.

    We're committed to making products better for you, and the world. This product is Standard 100 by OEKO-TEX certified, meaning that everything from the dyes and fabrics to accessories
    like buttons and zippers are tested and verified as free from harmful levels of more than 300 substances.", department: "baby")

    fisher_price = Product.create!(name: "Fisher-Price Deluxe Kick & Play Piano Gym", brand: "Fisher-Price", price: 86.99, description: "The Fisher-Price Deluxe Kick & Play Piano Gym
    features a soft playmat, repositionable toy arch, and 6 toys including a take-along piano with light-up keys and 4 musical settings to help keep your baby rocking out from newborn
    to toddler! With 3 Smart Stages learning levels, plus a bonus freestyle mode with real piano notes, you can change up the play as your baby grows from lay and play to tummy time to
    sitting up at the piano.", department: "baby, toys")

    glad = Product.create!(name: "Glad ForceFlex MaxStrength Tall Kitchen Drawstring Trash Bags - Febreze Beachside Breeze - 13 Gallon /45ct", brand: "Glad", price: 36.99, description:
    "Glad ForceFlex MaxStrength Tall Kitchen Trash Bags provide strength and Febreze Freshness to help keep your home smelling fresh and clean. These 13 gallon bags are 25% more durable*
    with an outer leak protection layer and an inner layer that stretches to prevent rips and tears. Febreze freshness in a Beachside Breeze scent provides odor neutralization while the
    light blue adds an aesthetic touch. The drawstring grips to the trash can, keeping the bag in place. With double side seams and a reinforced bottom, these tall kitchen trash bags
    are made with 100% renewable electricity. And heres something cool: if everyone in the U.S. chose Glad drawstring trash bags it would save 100 million pounds of plastic from going
    into landfills every year**. Certain trademarks used under license from The Procter & Gamble Company or its affiliates. *Vs. Glad 13 gallon ForceFlex bag. **Based on IRI sales data.
    Glad Kitchen drawstring bags are made with 7% to 22% less plastic vs top 10 competitors.", department: "household essentials")

    charmin = Product.create!(name: "Charmin Ultra Strong Toilet Paper", brand: "Charmin", price: 39.99, description: "Get sparkly clean with Charmin Ultra Strong. It's 4X stronger when
    wet* and has a diamond weave texture. It's woven like a washcloth and holds up when you wipe. It even cleans better so you can use less* and go longer without changing the roll**.
    We also made it MEGA in size, so you get mega value. That's right, our Charmin Ultra Strong Mega Roll is way bigger, equals 4 regular rolls, and it's more bang for your behind so
    you'll be running back to the store less and less (based on number of sheets in Charmin Regular Roll bath tissue). Our Charmin Ultra Strong toilet paper is also 2-ply and designed
    to be clog-safe and septic-safe so you can flush confidentially and keep clean. We all go, why not Enjoy The Go with America's favorite toilet paper***.*vs. leading USA 1-ply
    bargain brand** vs. Charmin Regular Roll***Charmin Brand based on sales. Source: Nielsen 2021 dollar sales.", department: "household essentials")

    mr_clean = Product.create!(name: "Mr. Clean Summer Citrus Scent Antibacterial Multi Surface All Purpose Cleaner - 128 fl oz", brand: "Mr. Clean", price: 18.99, description: "Mr. Clean
    antibacterial multi-surface cleaner cuts grease and removes grime. Use it all around the house to clean linoleum, tile & hardwood floors*, toilets and bathtubs. Outside, this
    all-purpose liquid cleaner and cleaning solution is perfect for garbage cans, doors and more. Get a powerful clean and a great scent with this multi-purpose cleaner. *use diluated
    only", department: "household essentials")

    arm_hammer = Product.create!(name: "Arm Hammer Plus OxiClean Odor Blasters Liquid Laundry Detergent", brand: "Arm & Hammer", price: 19.99, description: "ARM & HAMMER Plus OxiClean
    with Odor Blasters Liquid Laundry Detergent is ideal for standard and High Efficiency (HE) washers. This concentrated laundry detergent boasts triple power: it fights tough odors,
    blasts away stains and boosts freshness. Concentrated with 3X powerful odor fighters in every load versus the leading value detergent, this HE detergent handles your toughest loads in
    all wash temperatures, even cold water. OxiClean Stain fighters and Odor Blasters power away stains and fight tough odors like body odor, sweat and musty towels. Infuse a long-lasting
    fresh burst when you use this laundry detergent and odor remover. Blended with trusted ARM & HAMMER Baking Soda, this laundry soap is tough on odors, dirt and stains, leaving clothes
    clean and smelling fresh.", department: "household essentials")

    tide_pods = Product.create!(name: "Tide Pods Laundry Detergent Pacs - Spring Meadow", brand: "Tide", price: 24.99, description: "Tide PODS laundry detergent pacs offer surprisingly
    powerful clean in 1 step. Combining super concentrated detergent, extra odor fighters, and extra stain removers, each capsule cleans, freshens, and rejuvenates clothes for brighter
    brights and whiter whites. Small yet powerful, Tide PODS deliver cleaning power in a convenient, pre-measured unit dose form. Also, thanks to the special film and HE Turbo technology
    with quick-collapsing suds, the capsules dissolve completely in all temperatures and do not produce excess suds. The Spring Meadow scent is infused with with fresh floral notes to
    help keep your clothes smelling great. More than just a liquid in a pouch, Tide PODS delivers a surprisingly powerful clean in 1 step.", department: "household essentials")

    puffs = Product.create!(name: "Puffs Plus Lotion Facial Tissue", brand: "Puffs", price: 24.99, description: "Keep the soothing softness of Puffs Plus Lotion around to ease your
    sniffles and sneezes. Puffs soothes your nose from ordinary tissues so you can skip any sore, red nose issues. Puffs Plus Lotion is our most soothing facial tissue that locks in
    moisture* and helps calm irritated skin. With up to 50% more lotion**, it's no wonder that Puffs Plus Lotion is America's #1 selling Lotion Tissue***. A nose in need deserves Puffs
    indeed.*better than regular tissues** Up to 50% more lotion vs. leading lotion competitor*** Based on sales data", department: "household essentials")

    bounce = Product.create!(name: "Bounce Lasting Fresh Mega Dryer Sheets - Outdoor Fresh", brand: "Bounce", price: 34.99, description: "Wouldn't you love if your clothes could keep that
    fresh from the dryer feeling for longer? With Bounce LastingFresh Mega Dryer Sheets they can! From the time you take your clothes out of the dryer til the time you take them out of
    the drawer, that long lasting freshness will be there for you to enjoy! Just toss one Bounce LastingFresh dryer sheet into your dryer for 40 days of freshness you quite simply can't
    get with regular dryer sheets. That's because Bounce Mega Sheets are bigger, which means each dryer sheet is able to hold 3X the freshness ingredients* compared to the leading dryer
    sheet. Imagine the outdoor fresh, clean scent that Bounce is famous for, lasting from the time you do your laundry, til you take your clothes out of the drawer. Not only that, like
    all Bounce sheets, our LastingFresh Mega sheets help fabrics come out of the dryer with less static cling, looking less wrinkly and softer to touch, so you can look and feel your
    best. Try them once and you'll want to make Bounce LastingFresh dryer sheets your go-to 4-in-1 solution for all your dryer-safe fabrics. Feeling Fresh starts in the Dryer, with Bounce
    LastingFresh Mega Dryer Sheets!Directions: Just use 1 Bounce LastingFresh Mega Sheet per normal dryer load. Enjoy long-lasting freshness in fabrics, as well as less wrinkles, static
    and extra softness with an outdoor fresh and clean scent that smells great from the dryer and lasts when you go to smell it from the drawer.", department: "household essentials")

    ziploc = Product.create!(name: "Ziploc Sandwich Bags", brand: "Ziploc", price: 17.99, description: "Unloc ‘fun on the run’ with Ziploc® brand sandwich bags. Featuring Grip ‘n Seal
    technology that includes easy-open tabs and non-slip textured grips, these BPA-free plastic resealable sandwich bags are easy to open, hold and seal. That means they’re great at
    providing effortless access to sumptuous sandwiches for kids and adults alike. Lock in the love and freshness. Unloc easy enjoyment.

    The easy-to-use, durable nature of these Ziploc® sandwich bags means they’re ideal for use in packed lunches, picnics or for enjoyment ‘on the go’. You can also use them to store
    food and non-food items around the house – think kids crayons, craft items, stationery and much more.
    
    These bags can be used again and again (when used as directed), which means you save money and reduce waste. Unloc better living with Ziploc® reusable sandwich bags!",
    department: "household essentials")

    rubbermaid = Product.create!(name: "Rubbermaid 7 Cup Plastic Food Storage Container Red", brand: "Rubbermaid", price: 21.99, description: "Easily store food, plus minimize kitchen
    clutter, by using Rubbermaid Food Storage Containers with Easy Find Lids. This meal prep container features a built-in lid vent for splatter-resistant microwaving. The lid snaps to
    the bottom of the container and is bright red, so it's always easy to find. Constructed from durable, BPA-free plastic, this food container is built to withstand a wide range of
    temperatures and is dishwasher and freezer safe, and fully microwave safe when the vent is opened. And thanks to the clear base, it's easy to see what's inside.",
    department: "household essentials")
    
    #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    airtag = Product.create!(name: "Apple AirTag (1 Pack)", brand: "Apple", price: 80.99, description: "AirTag. Keep track of your keys, wallet, luggage, backpack, and more, all in the
    Find My app. Play a sound on the built-in speaker, or say “Hey Siri, find my gym bag.”
    With select iPhone models, Precision Finding can lead you right to your nearby AirTag.1
    If it’s further away, hundreds of millions of Apple devices in the Find My network
    can help track it down. All anonymously and encrypted for privacy.", department: "apple, electronics")
    
    apple_pencil = Product.create!(name: "Apple Pencil 2nd Generation", brand: "Apple", price: 179.99, description: "Apple Pencil (2nd generation) brings your work to life. With
    imperceptible lag, pixel-perfect precision, and tilt and pressure sensitivity, it transforms into your favorite creative instrument, your paint brush, your charcoal, or your pencil.
    It makes painting, sketching, doodling, and even note-taking better than ever. It magnetically attaches to iPad Pro, iPad Mini and iPad Air,* charges wirelessly, and lets you change
    tools with a simple double tap.

    Other Features
    • Magnetically attaches and pairs", department: "apple, electronics")
    
    magsafe_battery = Product.create!(name: "Apple MagSafe Battery Pack", brand: "Apple", price: 126.99, description: "Attaching the MagSafe Battery Pack is a snap. Its compact, intuitive
    design makes on-the-go charging easy. The perfectly aligned magnets keep it attached to your iPhone 12 and iPhone 12 Pro, iPhone 13 and iPhone 13 Pro, or iPhone 14 and 14 Pro —
    providing safe and reliable wireless charging. And it automatically charges, so there’s no need to turn it on or off. There’s no interference with your credit cards or key fobs either.

    At your desk and need a charge? Just plug a Lightning cable into the MagSafe Battery Pack for up to 15W of wireless charging. Short on time? With a higher than 20W power adapter, you
    can charge both the MagSafe Battery Pack and your iPhone even faster. And you can track the status of your charge on the Lock Screen.
    
    WHAT’S IN THE BOX:
    – MagSafe Battery Pack
    – Note: Power adapter and cable sold separately.", department: "apple, electronics")
    
    airpods_max = Product.create!(name: "Apple AirPods Max", brand: "Apple", price: 809.99, description: "AirPods Max reimagine over-ear headphones. An Apple-designed driver provides
    high-fidelity audio. Every detail, from canopy to cushions, has been designed for an exceptional fit. Industry-leading Active Noise Cancellation blocks outside noise, while
    Transparency mode lets it in.

    • Apple-designed dynamic driver provides high-fidelity audio
    • Active Noise Cancellation blocks outside noise, so you can immerse yourself in music
    • Transparency mode for hearing and interacting with the world around you
    • Spatial audio with dynamic head tracking places sound all around you¹
    • Computational audio combines custom acoustic design with the Apple H1 chip and software for breakthrough listening experiences
    • Designed with a knit-mesh canopy and memory foam ear cushions for an exceptional fit
    • Available in silver, space gray, sky blue, green, and pink
    • 20 hours of listening, movie watching, or talk time with Active Noise Cancellation and spatial audio enabled²
    • Store in ultra low-power mode with the slim Smart Case
    • Effortless setup, on-head detection, and automatic switching for a magical experience³
    • Easily share audio between two sets of AirPods on your iPhone, iPad, iPod touch, or Apple TV", department: "apple, electronics")

    magic_mouse = Product.create!(name: "Magic Mouse - White Multi-Touch Surface", brand: "Apple", price: 139.99, description: "Magic Mouse is wireless and rechargeable, with an optimized foot design that lets it glide smoothly across your desk. The Multi-Touch surface allows you to perform simple gestures such as swiping between web pages and scrolling through documents.

    The rechargeable battery will power your Magic Mouse for about a month or more between charges. It’s ready to go right out of the box and pairs automatically with your Mac or iPad,
    and it includes a woven USB-C to Lightning Cable that lets you pair and charge by connecting to a USB-C port on your Mac or iPad.
    
    What's in the Box:
    Magic Mouse
    USB-C to Lightning Cable", department: "apple, electronics")

    apple_watch = Product.create!(name: "Apple Watch Series 9 GPS + Cellular Aluminum Case with Sport Band", brand: "Apple", price: 739.99, description: "Apple Watch Series 9 helps you 
    stay connected, active, healthy, and safe. Featuring double tap, a magical way to interact with Apple Watch,1 an even-brighter display, faster on-device Siri, and Precision Finding for 
    iPhone.²\n
    \n
    Technical specifications\n
    Go to apple.com/watch/compare for complete set.\n
    \n
    Legal\n
    Apple Watch Series 9 requires iPhone Xs or later with iOS 17 or later.\n
    ¹Available late 2023. Requires Apple Watch Series 9 or Apple Watch Ultra 2.\n
    ²Requires an iPhone and Apple Watch with second-generation Ultra Wideband chip.\n
    ³Learn more at apple.com/2030.\n
    ⁴The Blood Oxygen app is for wellness purposes only and not for medical use.\n
    ⁵The ECG app is available on Apple Watch Series 4 and later (excluding Apple Watch SE) and can generate an ECG similar to a single-lead electrocardiogram. Intended for use by people
    22 years old and over.\n
    ⁶Irregular rhythm notification requires the latest versions of watchOS and iOS. It is not intended for use by people under 22 years old or those who have been previously diagnosed
    with atrial fibrillation (AFib).\n
    ⁷The temperature sensing feature is not intended for medical use.\n
    ⁸The Cycle Tracking app should not be used for birth control or to diagnose a health condition.\n
    ⁹A subscription is required for Apple Fitness+.\n
    ¹⁰Fall Detection updates are available on Apple Watch Series 4 and later with watchOS 8 and later.\n
    ¹¹Emergency SOS requires a cellular connection or Wi-Fi Calling with an internet connection from your Apple Watch or nearby iPhone.\n
    ¹²Apple Pay is not available in all markets. For a list of Apple Pay countries and regions, visit support.apple.com/en-us/HT207957.\n
    ¹³Apple Watch Series 9 is rated IP6X dust resistant.\n
    ¹⁴Apple Watch Series 9 has a water resistance rating of 50 meters under ISO standard 22810:2010. This means it may be used for shallow-water activities like swimming in a pool or
    ocean. Apple Watch Series 9 should not be used for scuba diving, waterskiing, or other activities involving high-velocity water or submersion below shallow depth. Water resistance
    is not a permanent condition and can diminish over time. For additional information, see support.apple.com/HT205000. Apple Watch Series 9 is also rated IP6X dust resistant.\n
    ¹⁵Wireless service plan required for cellular service. Contact your service provider for more details. Connection may vary based on network availability. Check apple.com/watch/cellular
    for participating wireless carriers and eligibility. See support.apple.com/en-us/HT207578 for additional setup instructions.\n
    ¹⁶Not all features will be available if the Apple Watch is set up through Family Setup. Wireless service plan required for cellular service. Contact your service provider for more
    details. Check apple.com/watch/cellular for participating wireless carriers and eligibility.", department: "apple, electronics")

    watch_ultra = Product.create!(name: "Apple Watch Ultra 2 GPS + Cellular Titanium Case with Alpine Loop", brand: "Apple", price: 1479.99, description: "The most rugged and capable Apple
    Watch. Designed for outdoor adventures and supercharged workouts with a lightweight titanium case, extra-long battery life,¹ and the brightest-ever display. Featuring double tap,² a
    magical way to interact with Apple Watch, and Precision Finding³ to guide you to your iPhone.   

    Technical specifications
    Go to apple.com/watch/compare for complete set.
    
    Legal
    Apple Watch Ultra 2 requires iPhone Xs or later with iOS 17 or later.
    ¹Battery life varies by use and configuration. See apple.com/batteries for more information.
    ²Available late 2023. Requires Apple Watch Series 9 or Apple Watch Ultra 2.
    ³Requires an iPhone and Apple Watch with second-generation Ultra Wideband chip.
    ⁴Learn more at apple.com/2030.
    ⁵Apple Watch Ultra 2 has a water resistance rating of 100 meters under ISO standard 22810 and may be used for high-speed water sports and recreational scuba diving (with compatible
    third-party app from the App Store) to 40 meters. Should not be used for diving below 40 meters. Water resistance is not a permanent condition and can diminish over time. For
    additional information, see support.apple.com/HT205000. Apple Watch Ultra 2 is also rated IP6X dust resistant.
    ⁶Wireless service plan required for cellular service. Contact your service provider for more details. Connection may vary based on network availability. Check apple.com/watch/cellular
    for participating wireless carriers and eligibility. See support.apple.com/en-us/HT207578 for additional setup instructions.
    ⁷International roaming coverage is determined by your carrier. Please check with your carrier for details. For a list of supported carriers, see apple.com/watch/cellular. 
    ⁸A subscription is required for Oceanic+. Available on the App Store. Always follow diving protocols and dive with a companion and have a secondary device.
    ⁹The Blood Oxygen app is for wellness purposes only and not for medical use.
    ¹⁰The ECG app is available on Apple Watch Series 4 and later (excluding Apple Watch SE) and can generate an ECG similar to a single-lead electrocardiogram. Intended for use by people
    22 years old and over.
    ¹¹Fall Detection updates are available on Apple Watch Series 4 and later with watchOS 8 and later. 
    ¹²Emergency SOS requires a cellular connection or Wi-Fi Calling with an internet connection from your Apple Watch or nearby iPhone.", department: "apple, electronics")

    iphone15 = Product.create!(name: "Apple iPhone 15 Plus", brand: "Apple", price: 3679.99, description: "iPhone 15 Plus brings you Dynamic Island, a 48MP Main camera, and USB-C—all in a durable color-infused glass and aluminum design.

    Legal
    ¹iPhone 15, iPhone 15 Plus, iPhone 15 Pro, and iPhone 15 Pro Max are splash, water, and dust resistant and were tested under controlled laboratory conditions with a rating of IP68 under IEC standard 60529 (maximum depth of 6 meters up to 30 minutes). Splash, water, and dust resistance are not permanent conditions. Resistance might decrease as a result of normal wear. Do not attempt to charge a wet iPhone; refer to the user guide for cleaning and drying instructions. Liquid damage not covered under warranty.
    ²The display has rounded corners. When measured as a standard rectangle, the screen is 6.12 inches (iPhone 15 Pro, iPhone 15) or 6.69 inches (iPhone 15 Pro Max, iPhone 15 Plus) diagonally. Actual viewable area is less.
    ³Battery life varies by use and configuration; see apple.com/batteries for more information.
    ⁴Service is included for free for two years with the activation of any iPhone 15 model. Connection and response times vary based on location, site conditions, and other factors. See support.apple.com/kb/HT213885 for more information.
    ⁵iPhone 15 and iPhone 15 Pro can detect a severe car crash and call for help. Requires a cellular connection or Wi-Fi Calling.
    
    Technical specifications
    Go to apple.com/iphone/compare for a complete set.", department: "apple, electronics")

    iphone15pm = Product.create!(name: "Apple iPhone 15 Pro Max", brand: "Apple", price: 3679.99, description: "iPhone 15 Pro Max. Forged in titanium and featuring the groundbreaking A17 Pro chip, a customizable Action button, and the most powerful iPhone camera system ever.

    Legal
    ¹iPhone 15, iPhone 15 Plus, iPhone 15 Pro, and iPhone 15 Pro Max are splash, water, and dust resistant and were tested under controlled laboratory conditions with a rating of IP68 under IEC standard 60529 (maximum depth of 6 meters up to 30 minutes). Splash, water, and dust resistance are not permanent conditions. Resistance might decrease as a result of normal wear. Do not attempt to charge a wet iPhone; refer to the user guide for cleaning and drying instructions. Liquid damage not covered under warranty.
    ²The display has rounded corners. When measured as a standard rectangle, the screen is 6.12 inches (iPhone 15 Pro, iPhone 15) or 6.69 inches (iPhone 15 Pro Max, iPhone 15 Plus) diagonally. Actual viewable area is less.
    ³Battery life varies by use and configuration; see apple.com/batteries for more information.
    ⁴USB 3 cable with 10Gb/s speed required for up to 20x faster transfers on iPhone 15 Pro models.
    ⁵Wi-Fi 6E available in countries and regions where supported.
    ⁶Service is included for free for two years with the activation of any iPhone 15 model. Connection and response times vary based on location, site conditions, and other factors. See support.apple.com/kb/HT213885 for more information.
    ⁷iPhone 15 and iPhone 15 Pro can detect a severe car crash and call for help. Requires a cellular connection or Wi-Fi Calling.
    
    Technical specifications
    Go to apple.com/iphone/compare for a complete set.", department: "apple, electronics")

    iphone15pm.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/iphone15PM.jpg"),
        filename: "iphone15PM.jpg"
    )

    iphone15.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/iPhone15Plus.jpg"),
        filename: "iPhone15Plus.jpg"
    )

    watch_ultra.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/watchUltra2.jpg"),
        filename: "watchUltra2.jpg"
    )

    magsafe_battery.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/magsafe_battery.jpg"),
        filename: "magsafe_battery.jpg"
    )

    magic_mouse.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/magic_mouse.jpg"),
        filename: "magic_mouse.jpg"
    )

    airpods_max.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/airpods_max.jpg"),
        filename: "airpods_max.jpg"
    )

    airtag.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/airtag.jpg"),
        filename: "airtag.jpg"
    )

    apple_pencil.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/apple_pencil.jpg"),
        filename: "apple_pencil.jpg"
    )

    apple_watch.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/watchS9.jpg"),
        filename: "watchS9.jpg"
    )

    arm_hammer.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/arm_hammer.jpg"),
        filename: "arm_hammer.jpg"
    )
    
    baby_towel.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/baby_towel.jpg"),
        filename: "baby_towel.jpg"
    )
    
    baby_dove.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/baby_dove.jpg"),
        filename: "baby_dove.jpg"
    )
    
    avent.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/avent.jpg"),
        filename: "avent.jpg"
    )
    
    binder.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/binder.jpg"),
        filename: "binder.jpg"
    )
    
    baby_wash.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/baby_wash.jpg"),
        filename: "baby_wash.jpg"
    )
    
    fisher_price.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/fisher_price.jpg"),
        filename: "fisher_price.jpg"
    )
    
    charmin.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/charmin.jpg"),
        filename: "charmin.jpg"
    )
    
    bounce.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/bounce.jpg"),
        filename: "bounce.jpg"
    )
    
    glad.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/glad.jpg"),
        filename: "glad.jpg"
    )
    
    folder.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/folder.jpg"),
        filename: "folder.jpg"
    )
    
    huggies.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/huggies.jpg"),
        filename: "huggies.jpg"
    )
    
    glue.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/glue.jpg"),
        filename: "glue.jpg"
    )
    
    puffs.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/puffs.jpg"),
        filename: "puffs.jpg"
    )
    
    mr_clean.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/mr_clean.jpg"),
        filename: "mr_clean.jpg"
    )
    
    tide_pods.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/tide_pods.jpg"),
        filename: "tide_pods.jpg"
    )
    
    ruler.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/ruler.jpg"),
        filename: "ruler.jpg"
    )
    
    rubbermaid.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/rubbermaid.jpg"),
        filename: "rubbermaid.jpg"
    )
    
    ziploc.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/ziploc.jpg"),
        filename: "ziploc.jpg"
    )

    colored_pencils.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/colored_pencils.jpg"),
        filename: "colored_pencils.jpg"
    )

    expo.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/expo.jpg"),
        filename: "expo.jpg"
    )

    glue_stick.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/glue_stick.jpg"),
        filename: "glue_stick.jpg"
    )

    markers.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/markers.jpg"),
        filename: "markers.jpg"
    )

    mechanical_pencils.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/mechanical_pencils.jpg"),
        filename: "mechanical_pencils.jpg"
    )

    paper.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/paper.jpg"),
        filename: "paper.jpg"
    )

    ticonderoga.picture.attach(
        io: URI.open("https://arrow1-seeds.s3.amazonaws.com/ticonderoga.jpg"),
        filename: "ticonderoga.jpg"
    )

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
        author_id: 7,
        product_id: 8,
        rating: 3,
        title: "Mixed experiences",
        body: "Me and my husband bought one each and our experiences were completely different. He loves it. It’s his new favorite bottle and he’s had many before, including
        insulated ones. He likes his water cold so mainly keeps it in the fridge and/or with ice but it doesn’t bother him at all, it’s really easy to use and clean and I’m pretty
        sure this is the only filtered water bottle out there. Me on the other hand, I’m not sure why but every time I used it I’d pass both air and water at first, and then just water.
        This ended up in a lot of air bubbles in my throat and it was a really painful experience to make it go away. I will never use this again. That being said, we both would recommend
        it because I haven’t seen anyone experiencing what happened to me so it is most likely a rare case.",
        display_name: "Beverly C"
    )

    Review.create!(
        author_id: 8,
        product_id: 8,
        rating: 2,
        title: "Mold in spout",
        body: "I bought 2 of these one for myself and my sister and we both fell in love. We both noticed we are drinking more water and its great. However it hasnt even been 2 months
        and both spouts where you drink have mold growing in it. So i guess instead of just buying new filters we are gonna have to buy new bottles. Other then that we love it. And
        definitely wanna give it another try.",
        display_name: "Tab326"
    )

    Review.create!(
        author_id: 8,
        product_id: 9,
        rating: 3,
        title: "Disappointing changes this year",
        body: "We’ve had these chairs for years. They’re very sturdy and weather resistant. However, if you are looking to add onto a set that you already had, these are not the same
        size that they’ve been in past years. One of ours broke because because a big kid jumped on it, so I wanted to replace just that one. I just brought the new chair home and am
        disappointed to see that it’s about 3 inches shorter than the chairs we already have AND it’s wider so it doesn’t even stack well. Ugh. Not sure why they would change something
        so slightly like that that they carry each year. :(",
        display_name: "CMCO"
    )

    Review.create!(
        author_id: 9,
        product_id: 9,
        rating: 5,
        title: "Patio chairs",
        body: "Love these! Bought the teel colored ten years ago and they held up well; going to phase out the teel and bought tan in same style. Stackable is a major space saver.",
        display_name: "ShoppingLane25"
    )

    Review.create!(
        author_id: 10,
        product_id: 9,
        rating: 3,
        title: "Look it Over",
        body: "Check that it’s not wobbly before you buy. One leg was off so it rocked.",
        display_name: "Emma"
    )

    Review.create!(
        author_id: 11,
        product_id: 9,
        rating: 3,
        title: "Why shorter backs?",
        body: "I’m incredibly disappointed that the chair backs are shorter this year - I very much liked being able to lean my head back and be supported. Other than that, same great
        fabric, lightweight frame, and sturdy construction. Would love more color choices.",
        display_name: "Debbie F"
    )

    Review.create!(
        author_id: 1,
        product_id: 9,
        rating: 5,
        title: "Best chair ever",
        body: "I love love love this chair!!!!! I have it for the fourth year now and it’s still very sturdy and comfortable!!!! It works well in rain 🌧️ shine ☀️and wind 💨",
        display_name: "Hi Gee"
    )

    Review.create!(
        author_id: 9,
        product_id: 9,
        rating: 5,
        title: "Mesh stacking chairs",
        body: "These chairs are comfortable, attractive, and well made. Nice addition to my patio. Chairs stack easily for indoor storage and will be easy to clean. Good quality
        at a reasonable price.",
        display_name: "Happy lady in Florida"
    )

    Review.create!(
        author_id: 9,
        product_id: 10,
        rating: 4,
        title: "Xbox",
        body: "It’s awesome lately since I received it I’ve had trouble with the wifi disconnecting by itself and logging me out of the games I play. Sucks cause it only happens
        in the Xbox while all my other phones or technology is still connected.",
        display_name: "Lolis"
    )

    Review.create!(
        author_id: 8,
        product_id: 10,
        rating: 5,
        title: "Son loves this! Easy transition from the switch",
        body: "Decided to upgrade from a switch to this for our son and he is loving it. While he loves the switch there are no sport based games. He loves playing nhl, madden,
        and nba on the Xbox!",
        display_name: "Awhite"
    )

    Review.create!(
        author_id: 7,
        product_id: 10,
        rating: 5,
        title: "Best Gaming System EVER!",
        body: "The greatest gaming console ever made! The most comfortable controller in your hands Nintendo even you to copy the offset thumb sticks since your thumbs don’t collide
        with each other when you’re playing FPS games! Ultimate game pass puts this above and beyond any other home gaming experience, The elite series 2 controller is the greatest
        controller ever made as well. This system is so fast you wonder why I didn’t come out sooner, older Xbox titles from previous consoles look incredible on the system. The Xbox
        series X is the best single purchase I’ve made in the last five years I hope you will enjoy one as well!",
        display_name: "Realzies Cuts"
    )

    Review.create!(
        author_id: 6,
        product_id: 10,
        rating: 5,
        title: "Great Technology",
        body: "My son spends a lot of time on this with his friends. They love playing sports games, such as football and soccer. It is super fast and the graphics are amazing. It
        looks nice on the counter and was super easy to set up. It is very expensive!",
        display_name: "Amy1656"
    )

    Review.create!(
        author_id: 1,
        product_id: 10,
        rating: 5,
        title: "Best gaming console on the market when paired with xbox game pass",
        body: "having access to the Xbox game pass makes going with console an easy choice. all Microsoft published games released on game pass same day as available for sale.",
        display_name: "Nine"
    )

    Review.create!(
        author_id: 5,
        product_id: 10,
        rating: 5,
        title: "A must buy",
        body: "A amazing console never had any issues with it and really good power would recommend for any gift",
        display_name: "Noah Reef"
    )

    Review.create!(
        author_id: 5,
        product_id: 11,
        rating: 1,
        title: "Overpriced Junk",
        body: "This bike is definitely not worth the money. It has broken and been repaired several times. It’s a no from me!! Handle bars won’t stay straight, chain comes off track,
        overall problem after problem.",
        display_name: "Frustrated mom"
    )

    Review.create!(
        author_id: 4,
        product_id: 11,
        rating: 1,
        title: "Broke when i shifted the gear",
        body: "This Bike is not worth it, it is very expensive for its extremely poor quality. The first time I got it, I shifted the gear 1 level and it it was stuck and did not work
        anymore. It is also very heavy and clunky to ride, they used very cheap material. Thankfully the return process was easy but I would not recommend this bike.",
        display_name: "John"
    )

    Review.create!(
        author_id: 3,
        product_id: 11,
        rating: 5,
        title: "Really nice bike",
        body: "Bought for my grandson, and he couldn’t wait to ride it. It’s cool looking and seems very sturdy. The employees at Bonney Lake Target were awesome.",
        display_name: "Sewywabbit"
    )

    Review.create!(
        author_id: 2,
        product_id: 11,
        rating: 1,
        title: "Major Fail",
        body: "Received this bike and the post for the handle barsis on backwards. There is no way to turn it around. without a lot of force and scratching up the handle bar. This
        bike now has to be returned. ALso, I live in a cross border city which means I need to return this back to the US and bring a new one back to Canada. I took a chance and Target
        and Mongoose let me down. The box was damaged upon receiving the item too. There was a huge hole in the middle. Not happy. If zero stars was an option i would have selected zero.",
        display_name: "rblade"
    )

    Review.create!(
        author_id: 1,
        product_id: 11,
        rating: 5,
        title: "Awesome Mountain Bike",
        body: "[This review was collected as part of a promotion.] Mongoose- Mongoose Scepter 24\" Mountain Bike, 24\" wheels, 21 speeds, in Green/Blue color is an awesome mountain bike.
        Very easy to assemble, too. Mongoose brings its “push the limits” attitude to mountain bikes. The Standoff has a full suspension frame and front suspension fork so it will be
        comfortable chewing up rough terrain, and with 21 speeds and thick knobby tires nothing will stand in your way. Take it on the trail or adventure off the trail onto some gnarly
        single track. There is nothing you can't do on a Mongoose. Children must be 10 - 15 years old with a height of 4'8\"-5'6\" I highly recommend this mountain bike.",
        display_name: "MJ"
    )

    Review.create!(
        author_id: 2,
        product_id: 12,
        rating: 5,
        title: "Good Car",
        body: "Good car and looks like the movie, accurate minifigure but too many stickers.",
        display_name: "SHAHMAN"
    )

    Review.create!(
        author_id: 1,
        product_id: 12,
        rating: 5,
        title: "Amazing hoping for more fast and furious vehicles!",
        body: "Amazing build super fun! Really hoping for a car for Han next in Tokyo Drift! Paul Walker minifig is great and the car build is fantastic!",
        display_name: "CasualNya086"
    )

    Review.create!(
        author_id: 3,
        product_id: 12,
        rating: 5,
        title: "Fast & Furious Lego",
        body: "Loved it! It was a gift to my brother and he instantly built it. All the pieces were there.",
        display_name: "Laura"
    )

    Review.create!(
        author_id: 4,
        product_id: 12,
        rating: 5,
        title: "been eying this one up for a while👀",
        body: "I’ve been eyeing this set up for a while wanting to purchase it however i received it as a gift 3 days ago for my birthday!! this is one of the best builds i’ve done
        there was no fiddly pieces or pieces that snap off when you add a brick to it, it’s genuinely one of the cleanest lego builds out there, for such a small car there’s great detail,
        don’t hesitate if you’re thinking about it buy it now!!",
        display_name: "salo"
    )

    Review.create!(
        author_id: 5,
        product_id: 12,
        rating: 5,
        title: "Awesome",
        body: "One of the better movie cars from the theme. And the mini fig is really good.",
        display_name: "Paul Walker"
    )

    Review.create!(
        author_id: 6,
        product_id: 12,
        rating: 5,
        title: "Great lego set",
        body: "I bought this Lego set because I am a fan of fast and the furious and my son loves it to",
        display_name: "Dead84"
    )

    Review.create!(
        author_id: 7,
        product_id: 12,
        rating: 5,
        title: "{:",
        body: "it was very descriptive and cool looking I kept it in my speed champions collections.",
        display_name: "Eesa"
    )

    Review.create!(
        author_id: 8,
        product_id: 12,
        rating: 5,
        title: "Favourite Lego so far",
        body: "Got this as a gift for my father who is a fan of Fast and Furious. It was so fun building it for him :)",
        display_name: "Chiara Juliette"
    )

    Review.create!(
        author_id: 8,
        product_id: 13,
        rating: 4,
        title: "Great combo!",
        body: "I love this combo! It is nice looking and practical. I like how the stroller can lay down flat into a bassinet for the smallest little ones and has multiple
        reclining options. I also appreciate the ability to put the infant car seat in. The material seems very durable.",
        display_name: "LisaLu"
    )

    Review.create!(
        author_id: 9,
        product_id: 13,
        rating: 5,
        title: "Love it",
        body: "The travel system is wonderful and we love it. The car seat is lightweight and cozy. The material is soft and great quality. Baby did not come out sweating after
        being in the car seat. The stroller is sturdy and stylish. It is easy to use and maneuver. It has a big canopy and decent storage space.",
        display_name: "Katrina"
    )

    Review.create!(
        author_id: 10,
        product_id: 13,
        rating: 5,
        title: "Deluxe stroller combo win!",
        body: "This stroller/car seat/bassinet combo is just amazing. It has it all and is so plush! It comes in black and grey (what we got) which I love. Easy to clean and keep
        clean. It was simple to put together and car seat can be used on its own or it snaps right into the stroller when baby is little. The stroller can be used alone as well when
        baby grows and isn’t using the infant seat any longer. The bassinet insert is the nearest part! Baby can lay completely flat when they’re super tiny or it actually tilts too!
        I’ve never seen a combo come with one of these. You could also take it out and use it separately by the side of your bed or even lay it in a crib and use it. So neat! I’m just
        in love with this. Baby arrives in a few weeks and so far we’ve used this to watch a friends baby and it went so well. I’ll definitely buy from this brand again.",
        display_name: "Jeyae"
    )

    Review.create!(
        author_id: 11,
        product_id: 13,
        rating: 5,
        title: "Excellent stroller/car seat combination",
        body: "This 5-in-1 travel system makes its versality the shining star. Being able to switch from the car seat to stroller with ease as well as having the reclining function
        will have your baby comfortable and at ease at all times. The material itself feels very soft durable. I feel my family is very safe with this product!",
        display_name: "Cspaulding"
    )

    Review.create!(
        author_id: 6,
        product_id: 13,
        rating: 5,
        title: "Beautiful & functional!",
        body: "This car seat and stroller feels ultra lux! The fabric on the infant seat specifically is so soft to the touch. The sunshade pulls down far enough to actually block
        out light or sun on a sleeping baby. I love that the fabric is easy to clean too! If you’re looking for a combo, one stop shop purchase for both an infant car seat and stroller,
        this is a great purchase in both value and aesthetics!",
        display_name: "aiyanarv"
    )

    Review.create!(
        author_id: 5,
        product_id: 13,
        rating: 4,
        title: "Travel system",
        body: "My fourth baby is 4 months old, so we’ve been through a LOT of car seats, strollers, and travel systems. While none have been perfect, I really feel travel systems are
        the way to go because all the parts work together! One of my favorite features is that the infant car seat on this one can snap right into the stroller without any extra
        adapters, and doesn’t require the toddler seat to be in it too. This makes it so convenient for on the go! And it’s not so bulky either! The stroller frame itself is pretty
        light, and has a large basket. It pushes easily and smoothly (no squeaking)! The brake is easy to engage or disengage, and you can lock the front wheels for uneven terrain.
        It has a nice leatherette handle, and comes with a cup holder. One of the coolest things about the frame is that when you fold it, it can stand and has a handle for lifting
        or carrying it! My only complaint is that it’s not possible to fold it one handed. I like that the seat for the stroller can convert to a bassinet seat for infants. My 2.5
        year old fits the seat in toddler mode, but despite being within the weight limit, my 5 year old was too tall. It can also face in or out. The extendable canopy is awesome
        too! Oddly enough, this seat does not seem to be able to fold at all. So to fold the stroller, it really has to be removed. I’ll also mention that we don’t have enough cargo
        space in our 3rd row sub to be able to fit both parts since we are using the 3rd row. The base for the car seat was easy to install, and it’s easy to reach the release at
        the back of the seat. The seat is light, and I like the fabrics used. The cover is machine washable! I do wish it was better secured to the seat though, as it seems to slip
        in one section at the back, and needs to be tugged down. The canopy comes off really easily too, which can be a bother to adjust each time we’re headed out. Baby seems really
        comfortable in it though! Overall, it’s a great travel system with some great features! I love that it can be configured multiple ways, but it might not be the best choice
        if you need something compact",
        display_name: "aiyanarv"
    )

    Review.create!(
        author_id: 5,
        product_id: 14,
        rating: 3,
        title: "Eh",
        body: "Doesn’t lather as much I would like",
        display_name: "Britney"
    )

    Review.create!(
        author_id: 1,
        product_id: 14,
        rating: 1,
        title: "Scented Water",
        body: "No soap. No lather. Scented water only. Waste of money. I’ve use this soap for over 20 years - never again!",
        display_name: "Janet"
    )

    Review.create!(
        author_id: 4,
        product_id: 14,
        rating: 1,
        title: "Ingredient check list",
        body: "Full of hormone and endocrine disrupters. This product is just full of toxins. Gross",
        display_name: "Toxinfreein2023"
    )

    Review.create!(
        author_id: 3,
        product_id: 14,
        rating: 3,
        title: "Great Product But 2 issues",
        body: "Love the product itself.. But the inflated cost is hurting my budget use to be affordable. I resorted to buying the refill bottle i get approximately (4-5) 11oz
        bottles out of it. But opening the refill bottle is a nightmare as its almost impossible to unscrew to remove the safety tab underneath my latest bottle resorted me breaking
        the flip cap trying to open it and then resulting me to pucture the tab with a fork. Not exactly the way i want to use the product.",
        display_name: "Pam"
    )

    Review.create!(
        author_id: 2,
        product_id: 14,
        rating: 5,
        title: "Good soap",
        body: "Smells good and works good; needed antibacterial soap for tattoo.",
        display_name: "Dre"
    )

    Review.create!(
        author_id: 7,
        product_id: 14,
        rating: 5,
        title: "Dial Antibacterial Soap",
        body: "Pleased with product. Satisfied with antibacterial soap.",
        display_name: "Dennis"
    )

    Review.create!(
        author_id: 8,
        product_id: 14,
        rating: 5,
        title: "Smells great!",
        body: "[This review was collected as part of a promotion.] I tried this product for free in exchange for my honest opinion. I tried the Dial Liquid Antibacterial Hand Soap
        Spring Water and I was very pleased with it. The size is a nice amount of 7.5 oz. The foam is a nice amount with a press of the pump. It is light and fresh on the hands. It
        does not lather up but it cleans my hands very nicely. They smell fresh and clean! I recommend this hand soap to anyone. It kills bacteria and I love that it does the job!",
        display_name: "Doreen1969"
    )

    Review.create!(
        author_id: 8,
        product_id: 15,
        rating: 5,
        title: "Cute",
        body: "It’s a little small so I don’t know if my fish will actually go inside it but it’s pretty well made for the price and looks great in my new aquarium",
        display_name: "Jay"
    )

    Review.create!(
        author_id: 9,
        product_id: 15,
        rating: 5,
        title: "Looks good in the tank",
        body: "Got this for my SpongeBob theme fish tank and it fit right in! Not too big or small and it definitely pulled the look together.",
        display_name: "Mueller"
    )

    Review.create!(
        author_id: 10,
        product_id: 15,
        rating: 5,
        title: "Great addition to my 29 gallon tank",
        body: "Great addition to my 29 gallon tank",
        display_name: "Sakshi"
    )

    Review.create!(
        author_id: 11,
        product_id: 15,
        rating: 5,
        title: "Cute",
        body: "I bought this for my child’s pet snail and it looks so cute.",
        display_name: "lilah"
    )

    Review.create!(
        author_id: 7,
        product_id: 15,
        rating: 5,
        title: "Krusty Krab",
        body: "Cute addition to our Spongebob themed fish tank. The snail loves hiding in it.",
        display_name: "Rich Matthews II"
    )

    Review.create!(
        author_id: 6,
        product_id: 15,
        rating: 4,
        title: "Looks great",
        body: "Looks great in my aquarium only downside is that it is VERY hard to get algae off",
        display_name: "Kyra"
    )

    Review.create!(
        author_id: 6,
        product_id: 16,
        rating: 5,
        title: "Get the job done",
        body: "I love these hangers for anything prone to getting the weird hanger indentions. I use them for everything in my closet now!",
        display_name: "Shopgal"
    )

    Review.create!(
        author_id: 5,
        product_id: 16,
        rating: 5,
        title: "Perfect for silk",
        body: "Awesome quality hangers, used to hang silk pajamas and holds perfectly",
        display_name: "Leikerkm"
    )

    Review.create!(
        author_id: 4,
        product_id: 16,
        rating: 5,
        title: "Clothing hangers",
        body: "Clothing doesn’t slide off these how it does on other hangersy",
        display_name: "Stephanie"
    )

    Review.create!(
        author_id: 1,
        product_id: 16,
        rating: 5,
        title: "Love these!",
        body: "These hangers are great to keep those tops organized that always want to slip off the hanger. I like that they are more narrow than the standard plastic hangers to help
        save space. I have been using them for probably 2 years and haven’t had one break.",
        display_name: "Whitney"
    )

    Review.create!(
        author_id: 3,
        product_id: 16,
        rating: 5,
        title: "Great buy!",
        body: "These are great, no more clothes slipping off or weird shape sticking out from fabric on shoulders.",
        display_name: "VMD"
    )

    Review.create!(
        author_id: 2,
        product_id: 16,
        rating: 5,
        title: "Favorite",
        body: "These are my favorite hangers! Clothes stay on and don’t end up falling off!",
        display_name: "Vans"
    )

    Review.create!(
        author_id: 2,
        product_id: 17,
        rating: 5,
        title: "My Christmas gift to myself!!",
        body: "I love that I used all my circle earnings and my gift cards to help purchase it. I love the size and color as well.",
        display_name: "Jack"
    )

    Review.create!(
        author_id: 3,
        product_id: 17,
        rating: 5,
        title: "Its apple",
        body: "Great buy. And of course it is Apple.",
        display_name: "fbrown1408"
    )

    Review.create!(
        author_id: 1,
        product_id: 17,
        rating: 5,
        title: "Great for on the go",
        body: "Good. Does everything I need",
        display_name: "Cgm"
    )

    Review.create!(
        author_id: 1,
        product_id: 18,
        rating: 5,
        title: "Great pens",
        body: "Love these! They write really well!",
        display_name: "SLP"
    )

    Review.create!(
        author_id: 2,
        product_id: 18,
        rating: 5,
        title: "Quality Pens",
        body: "These are a really good quality set of pens. I use them for hand lettering and they write so smoothly and the colors are very vibrant!",
        display_name: "Faro"
    )

    Review.create!(
        author_id: 3,
        product_id: 18,
        rating: 5,
        title: "My All-Time Favorite Pens!",
        body: "These pens are an absolute favorite of mine! They come in lots of fun but usable color and last forever! They write smoothly and I love that they are clickable so 
        they retract when carrying them and don't leave ink stains on everything!",
        display_name: "domergirl98"
    )

    Review.create!(
        author_id: 4,
        product_id: 18,
        rating: 1,
        title: "Pens",
        body: "Over $8 for a pen that sometimes decides to write and sometimes decides to use way too much ink. Regret buying, don't make the dame mistake I did.",
        display_name: "Red Keurig"
    )

    Review.create!(
        author_id: 5,
        product_id: 18,
        rating: 5,
        title: "Paper Mate Ink joy Pens",
        body: "Love these pens. Great as a teacher gift!",
        display_name: "Jaime"
    )

    Review.create!(
        author_id: 6,
        product_id: 18,
        rating: 5,
        title: "New Favorite Pens!",
        body: "I am a sucker for pens, but really picky. These do not smudge with highlighters and write so smooth. If you're looking for pens to use daily, give them a try!",
        display_name: "Bobaryu"
    )

    Review.create!(
        author_id: 7,
        product_id: 18,
        rating: 5,
        title: "Smooth with no smearing",
        body: "Love these pens. So smooth and they fry fast so no smearing",
        display_name: "Billy"
    )

    Review.create!(
        author_id: 8,
        product_id: 18,
        rating: 4,
        title: "Purples dry out",
        body: "I love them but the purple colors stop working almost immediately in every pack I’ve bought",
        display_name: "Bay"
    )

    Review.create!(
        author_id: 8,
        product_id: 19,
        rating: 5,
        title: "Best dishes",
        body: "I purchased 2 of the grey sets and I absolutely love these dishes. The plates have a nice high rim which keeps food from sliding off. When heating up food in the
        microwave the dishes do not get hot all over like my old dishes. The only negative is that the bowls do not stack well but big deal - these dishes are amazing! They look way
        more expensive than they are, Oh, and I love that they do not come with a bunch of useless coffee cups.",
        display_name: "Candy"
    )

    Review.create!(
        author_id: 9,
        product_id: 19,
        rating: 4,
        title: "Dish set",
        body: "It’s a very affordable and pretty set",
        display_name: "Bella"
    )

    Review.create!(
        author_id: 10,
        product_id: 19,
        rating: 5,
        title: "Beautiful",
        body: "They are so pretty and a nice size, very nice set . I paired it with the saybrook tumbler set cups from threshold",
        display_name: "Mickie"
    )

    Review.create!(
        author_id: 11,
        product_id: 19,
        rating: 5,
        title: "Perfect minimal dinner set.",
        body: "This is a great and very affordable set. Easy to clean and good for everyday use.",
        display_name: "R"
    )

    Review.create!(
        author_id: 7,
        product_id: 19,
        rating: 5,
        title: "Great so far",
        body: "Had about 1 week so far. Cleans nice and looks good, no issue.",
        display_name: "Peter K"
    )

    Review.create!(
        author_id: 6,
        product_id: 19,
        rating: 5,
        title: "Stoneware",
        body: "Color choices. Material used.",
        display_name: "Dishes"
    )

    Review.create!(
        author_id: 6,
        product_id: 20,
        rating: 5,
        title: "Vibrant Sound & Color",
        body: "Love the red vibrant color and the sound is amazing! Perfect to use while cleaning the house, washing the car, throwing parties and traveling to the beach. Very
        easy to use and connect to your phone and I love how small it is, you can bring it everywhere!",
        display_name: "Janicef"
    )

    Review.create!(
        author_id: 5,
        product_id: 20,
        rating: 5,
        title: "Great sound for the size",
        body: "Got this a few weeks ago, It is amazing for the size. The bass and mids are really good and loud.",
        display_name: "Arunasamarakon"
    )

    Review.create!(
        author_id: 4,
        product_id: 20,
        rating: 3,
        title: "Battery life",
        body: "Battery life is no 12 hours. Speaker sounds great but on a full charge I only get 6-7 hours of on a full charge",
        display_name: "Matt"
    )

    Review.create!(
        author_id: 3,
        product_id: 20,
        rating: 1,
        title: "Avoid the JBL Flip 6",
        body: "Made a mistake in assuming JBL would make a high-quality speaker. Our second mistake was buying that speaker from Target, since their customer service is basically
        nonexistent. We started using the speaker and thought the sound was OK, but something seemed off with the bass, but then we played the same songs side-by-side with our Sony
        Bluetooth speaker (about the same size) and noticed that the Sony sound was significantly clearer and had none of the deep bass reverb noise that was evident on the JBL. The
        JBL literally has a deep bass speaker rattle. Once you notice that, the speaker will drive you crazy. I’ve had problems with electronics from other stores, and generally they’ve
        been flexible when a product clearly doesn’t perform well. Target is the least helpful because they are so inflexible and rigid with regard to their return and exchange policy.
        I’m not saying that they’re wrong, I’m just saying that when given the chance to consider the problem and be helpful, they don’t step up.",
        display_name: "divedoctors"
    )

    Review.create!(
        author_id: 2,
        product_id: 20,
        rating: 5,
        title: "Worth every penny!",
        body: "This little speaker is a powerhouse. Perfect for backyard use. Great for the beach.",
        display_name: "Boy Mom"
    )

    Review.create!(
        author_id: 1,
        product_id: 20,
        rating: 3,
        title: "JBL Flip 5 vs the flip 6",
        body: "The sound quality is good but the battery life sucks the JBL flip 6 versus the flip 5 the flip 5 battery life last a lot longer than the flip 6 so I think the JBL flip 5
        is better because of the battery life",
        display_name: "TODDYPOOH"
    )
# end