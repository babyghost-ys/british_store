# Import
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'down'
require 'fileutils'

# Remove the existing data
OrderDetail.delete_all
Order.delete_all
Customer.delete_all
AdminUser.delete_all
Product.delete_all
Category.delete_all
PageContent.delete_all
PageName.delete_all

# Function to fetch data
def fetch_data(urlString)
  url = URI(urlString)

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)

  response = http.request(request)
  JSON.parse(response.read_body)
end

# Create the ActiveAdmin user
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'tips-hk@winandmac.com', password: 'U!Tb7UJUMdtiiQ@', password_confirmation: 'U!Tb7UJUMdtiiQ@') if Rails.env.production?

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

# Fetch APIs from cached server

# Main code to fetch the API
# Queens API
# Create the download directory first
FileUtils.mkdir_p("#{Rails.root}/app/assets/images/dbimports/download/queen")

queens_json = fetch_data('https://webdev2.winandmac.com/ukapis/queen.json')
queens = queens_json['data']

# Loop through the returned items
queens.each do |queen|
  new_queen_item = Product.find_or_create_by(
    name: queen['product_title'],
    description: queen['product_description'],
    current_price: (queen['offer']['price'].gsub("£", "").to_f * 1.61).round(2),
    category: other_category
  )

  tempfile = Down.download(queen['product_photos'][0])
  FileUtils.mv(tempfile.path, "#{Rails.root}/app/assets/images/dbimports/download/queen/#{queen['product_id']}.jpg")

  new_queen_item.image.attach(
    io: File.open(File.join(Rails.root,"app/assets/images/dbimports/download/queen/#{queen['product_id']}.jpg")),
    filename: "#{queen['product_id']}.jpg"
  )
end

# T-Shirt API
FileUtils.mkdir_p("#{Rails.root}/app/assets/images/dbimports/download/tshirt")

tshirt_json = fetch_data('https://webdev2.winandmac.com/ukapis/tshirt.json')
tshirts = tshirt_json['data']

# Loop through the returned items
tshirts.each do |tshirt|
  new_tshirt_item = Product.find_or_create_by(
    name: tshirt['product_title'],
    description: tshirt['product_description'],
    current_price: (tshirt['offer']['price'].gsub("£", "").to_f * 1.61).round(2),
    category: category_clothes
  )

  tempfile = Down.download(tshirt['product_photos'][0])
  FileUtils.mv(tempfile.path, "#{Rails.root}/app/assets/images/dbimports/download/tshirt/#{tshirt['product_id'].gsub(":", "")}.jpg")

  new_tshirt_item.image.attach(
    io: File.open(File.join(Rails.root,"app/assets/images/dbimports/download/tshirt/#{tshirt['product_id'].gsub(":", "")}.jpg")),
    filename: "#{tshirt['product_id'].gsub(":", "")}.jpg"
  )
end

# Tea API
FileUtils.mkdir_p("#{Rails.root}/app/assets/images/dbimports/download/tea")

tea_json = fetch_data('https://webdev2.winandmac.com/ukapis/uktea.json')
teas = tea_json['data']

# Loop through the returned items
teas.each do |tea|
  new_tea_item = Product.find_or_create_by(
    name: tea['product_title'],
    description: tea['product_description'],
    current_price: (tea['offer']['price'].gsub("£", "").to_f * 1.61).round(2),
    category: tea_category
  )

  tempfile = Down.download(tea['product_photos'][0])
  FileUtils.mv(tempfile.path, "#{Rails.root}/app/assets/images/dbimports/download/tea/#{tea['product_id'].gsub(":", "")}.jpg")

  new_tea_item.image.attach(
    io: File.open(File.join(Rails.root,"app/assets/images/dbimports/download/tea/#{tea['product_id'].gsub(":", "")}.jpg")),
    filename: "#{tea['product_id'].gsub(":", "")}.jpg"
  )
end

# UK Crisps API
FileUtils.mkdir_p("#{Rails.root}/app/assets/images/dbimports/download/crisps")

crisps_json = fetch_data('https://webdev2.winandmac.com/ukapis/ukcrisps.json')
crisps = crisps_json['data']

# Loop through the returned items
crisps.each do |crisp|
  new_crisp_item = Product.find_or_create_by(
    name: crisp['product_title'],
    description: crisp['product_description'],
    current_price: (crisp['offer']['price'].gsub("£", "").to_f * 1.61).round(2),
    category: snacks_category
  )

  tempfile = Down.download(crisp['product_photos'][0])
  FileUtils.mv(tempfile.path, "#{Rails.root}/app/assets/images/dbimports/download/tea/#{crisp['product_id']}.jpg")

  new_crisp_item.image.attach(
    io: File.open(File.join(Rails.root,"app/assets/images/dbimports/download/tea/#{crisp['product_id']}.jpg")),
    filename: "#{crisp['product_id']}.jpg"
  )
end