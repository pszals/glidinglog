##Background
This is a tool to log and display flight recordings from IGC files. I enjoy paragliding and want a place for myself and others to easily keep track of past flights, keeping a running tally of number of flights and total air time. To see the sport in action, you can check out some videos [here](https://www.youtube.com/channel/UChd-nlrI9eJlck3muC0SUhw)

##Dependencies
Ensure you have Bundler installed, then execute `bundle install`.

##Running the Tests
To run the tests, execute `bundle exec rspec`.

##Running locally
To start the app, navigate to the project's root and execute `bundle exec rackup`.

##Deployment
Currently hosted on Heroku at glidinglog.herokuapp.com

##TODO
- User
  - Sign up
  - Authentication
- Flight file upload
  - Validate no duplicate entries
  - Validate file type
  - Drag and drop upload
- Flights Index page
  - Distance of all flights
  - Duration of all flights
  - Total number of flights
- Flights Show page
  - Distance of flight
  - Duration of all flights
  - Glider type
  - Location (country? state? park?)
  - Flight comments
  - Pictures
  - Videos (embedded or links?)
