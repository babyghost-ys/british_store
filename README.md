# Ruby on Rails Project for school - The Very British Store

Step 1. Clone the project

Step 2. Go to the project directory from now on. Then, run "bundle install"

Step 3. Run "rails db:migrate", or just click on the "Run pending migration" prompt in the website.

Step 4. Run "./bin/rails tailwindcss:install" (Mac) or "rails tailwindcss:install". You may see some conflicts. Just type "y" to confirm when you see that.

Step 5. Run "rails db:seed" if you want to populate some testing data.

Step 6. Run "rails s" to start the site. If you want the Stripe Checkout (Cart) to work, please run "PUBLISHABLE_KEY=YourStripePublishableKey SECRET_KEY=YourStripeSecretKey rails s"

PLEASE NOTE: This project is built in Ruby 3.1.2p20 with Rails 7.0.4.

You can also access my site at heroku: 
https://enigmatic-ridge-88421.herokuapp.com
