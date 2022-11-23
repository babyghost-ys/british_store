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
t_shirt = Product.find_or_create_by(name: "T-Shirt", current_price: 10.00, category: category_clothes)
t_shirt.image.attach(
  io:  File.open(File.join(Rails.root,'app/assets/images/dbimports/tshirt.jpg')),
  filename: 'tshirt.jpg'
)

Category.find_or_create_by(name: "Home & Decor")
Category.find_or_create_by(name: "Tea")
Category.find_or_create_by(name: "British Snacks")
Category.find_or_create_by(name: "Art and Collectibles")
Category.find_or_create_by(name: "Greeting Cards")
Category.find_or_create_by(name: "Others")