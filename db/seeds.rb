# Import

# Remove the existing data
AdminUser.delete_all
Product.delete_all
Category.delete_all
PageContent.delete_all
PageName.delete_all

# Create the ActiveAdmin user
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Create the database entries for the Contact and About pages
contact_page = PageName.find_or_create_by(name: 'Contact')
PageContent.find_or_create_by(header: 'Contact Us', content: 'Contact page content', page_name: contact_page)

about_page = PageName.find_or_create_by(name: 'About')
PageContent.find_or_create_by(header: 'About Us', content: 'About page content', page_name: about_page)

# Create the categories
category_clothes = Category.find_or_create_by(name: "Clothes")

t_shirt = Product.find_or_create_by(name: "T-Shirt", description: "A cool T-shirt with a big UK flag.", current_price: Faker::Commerce.price(range: 10..20.0), category: category_clothes)
t_shirt.image.attach(
  io:  File.open(File.join(Rails.root,'app/assets/images/dbimports/tshirt.jpg')),
  filename: 'tshirt.jpg'
)

home_category = Category.find_or_create_by(name: "Home & Decor")
ukmap = Product.find_or_create_by(name: "British Islands Geological Map", description: "Reproduction of 1969 Geological Map of The British Islands using satellite data to impose the topography onto the map. ", current_price: Faker::Commerce.price(range: 10.0..80.0), category: home_category)
ukmap.image.attach(
  io: File.open(File.join(Rails.root,'app/assets/images/dbimports/ukmap.jpg')),
  filename: 'ukmap.jpg'
)
ukpillow = Product.find_or_create_by(name: "Union Jack Pillow", description: "Personalised Embroidered Union Jack Flag Accent Pillow Vintage Style Filled Boudoir Cushion Cute Housewarming Gift British Home Decor.", current_price: Faker::Commerce.price(range: 15.0..80.0), category: home_category)
ukpillow.image.attach(
  io: File.open(File.join(Rails.root,'app/assets/images/dbimports/ukpillow.jpg')),
  filename: 'ukpillow.jpg'
)
tube = Product.find_or_create_by(name: "London Underground Map", description: "London Underground Map Poster - A3 Size - 297mm x 420mm - Printed on 250gsm Silk Paper.", current_price: Faker::Commerce.price(range: 10.0..80.0), category: home_category)
tube.image.attach(
  io: File.open(File.join(Rails.root,'app/assets/images/dbimports/tube.jpg')),
  filename: 'tube.jpg'
)

tea_category = Category.find_or_create_by(name: "Tea")
tea_set = Product.find_or_create_by(name: "M&S Tea and Biscuits Brit Kit", description: "Most Brits will agree, you simply can't beat a cup of tea with a nice biscuit, whether that’s in front of the TV or alongside a nice chat with a friend. M&S do a lot of things well, and making delicious tea and biscuits is one of them. So, to celebrate all things teatime we’ve put together a special assortment of our favourite M&S teas and biscuits. Including the classic Milk Chocolate Digestives & the indulgent All Butter Triple Belgian Chunk Cookies. Products shown will be included whilst stocks last. If out of stock, we will substitute with a similar product of equal value.", current_price: Faker::Commerce.price(range: 0..20.0), category: tea_category)
tea_set.image.attach(
  io: File.open(File.join(Rails.root,'app/assets/images/dbimports/tea_set.jpg')),
  filename: 'tea_set.jpg'
)
yorkshire_tea = Product.find_or_create_by(name: "Yorkshire Tea", description: "Yorkshire Tea is a brand of tea produced by Taylors of Harrogate. It is the best-selling brand of tea in the United Kingdom, and is also sold in Australia, New Zealand, Canada, and the United States.", current_price: Faker::Commerce.price(range: 10.0..20.0), category: tea_category)
yorkshire_tea.image.attach(
  io: File.open(File.join(Rails.root,'app/assets/images/dbimports/yorkshire_tea.jpg')),
  filename: 'yorkshire_tea.jpg'
)
y_tea2 = Product.find_or_create_by(name: "Yorkshire Tea Toast & Jam Brew Flavoured Tea 40 Bags 125g (3 Pack)", description: "Yorkshire Tea is a brand of tea produced by Taylors of Harrogate. It is the best-selling brand of tea in the United Kingdom, and is also sold in Australia, New Zealand, Canada, and the United States.", current_price: Faker::Commerce.price(range: 5.0..20.0), category: tea_category)
y_tea2.image.attach(
  io: File.open(File.join(Rails.root,'app/assets/images/dbimports/y_tea2.jpg')),
  filename: 'y_tea2.jpg'
)

snacks_category = Category.find_or_create_by(name: "British Snacks")
crisps = Product.find_or_create_by(name: "Crisps", description: "Crisps are a British snack food, made by Snack Foods Ltd.", current_price: Faker::Commerce.price(range: 5..10.0), category: snacks_category)
crisps.image.attach(
  io: File.open(File.join(Rails.root,'app/assets/images/dbimports/crisps.jpg')),
  filename: 'crisps.jpg'
)

art_category = Category.find_or_create_by(name: "Art and Collectibles")
ukflag = Product.find_or_create_by(name: "Union Jack Flag", description: "Made from aged unbleached linen, to create an antique finish, this Union Jack flag is finished with a wooden toggle. Signifying the the red cross of St George, the white saltire of St Andrew, and the red saltire of St Patrick. Product for indoor use only. Length: 100 cm x Height: 60 cm", current_price: Faker::Commerce.price(range: 10.0..40.0), category: art_category)
ukflag.image.attach(
  io: File.open(File.join(Rails.root,'app/assets/images/dbimports/ukflag.jpg')),
  filename: 'ukflag.jpg'
)

other_category = Category.find_or_create_by(name: "Others")
harrypotter = Product.find_or_create_by(name: "Harry Potter Books collection", description: "Harry Potter is a series of fantasy novels written by British author J. K. Rowling. The novels chronicle the life of a young wizard, Harry Potter, and his friends Hermione Granger and Ron Weasley, all of whom are students at Hogwarts School of Witchcraft and Wizardry. The main story arc concerns Harry's struggle against Lord Voldemort, a dark wizard who intends to become immortal, overthrow the wizard governing body known as the Ministry of Magic, and subjugate all wizards and muggles, a reference term that means non-magical people.", current_price: Faker::Commerce.price(range: 100.0..400.0), category: other_category)
harrypotter.image.attach(
  io: File.open(File.join(Rails.root,'app/assets/images/dbimports/harrypotter.jpg')),
  filename: 'harrypotter.jpg'
)