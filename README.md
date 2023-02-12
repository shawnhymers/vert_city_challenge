# README

To get started

1. Run the DB migration by running the following in the project directory bin/rails db:migrate RAILS_ENV=development 

2. Optionally you can get the DB started with a few great Canadian properties using the following in the project directory

bin/rails console

Property.create(name:"CN Tower", street_address:"290 Bremner Blvd, Toronto", city:"Toronto", country:'Canada', lat:43.6426, long:79.3871)

Property.create(name:"West Edmonton Mall", street_address:"8882 170 St NW", city:"Edmonton", country:'Canada', lat:53.5225, long:-113.6241)

Property.create(name:"Pan Pacific, Whistler", street_address:"4299 Blackcomb Way", city:"Whistler", country:'Canada', lat:50.1158 ,long:-122.9501)

3. Then the project can be run with the following in the project directory bin/rails s

To connect to live data follow these steps:

1. Add the api key to credentials.yml.enc
To access the encrypted file run editor= code —wait rails credentials:edit
Set the api key as demo_data_api_key:API_KEY_HERE

2. In properties_controller.rb change the following in new_property, update, update_all:
Comment out the line api_url='fake_url'
Remove the comments around the real api_url concatenation

3. In properties_helper.rb 
Comment out the hard coded demo_data variable
Remove the comments around the api call


