# README

This is my solution to the Mars Rover Challenge found here: [https://code.google.com/archive/p/marsrovertechchallenge/](https://code.google.com/archive/p/marsrovertechchallenge/)

The require gems will be RSPEC, this was used for testing the application.

There are two ways I solved this challenge.
First: I created a web application in Ruby on Rails that once started, will produce several html sites to input data, review data inputs, and finally view the outcome of the data. The expected outcome is calculated and dealt with in the backend of the server using a database (sqlite3), lib classes and two controllers to handle the information.

To start the Ruby on Rails server:

* Required versions: Ruby 2.3.3p222 (2016-11-21 revision 56859), Rails 5.1.6.1, Gem 2.5.2, Bundler version 1.15.3, sqlite3 (1.3.13 x86-mingw32), rspec (3.8.0)

* Please ensure that after pulling repo, run 'bundle install' in the command line (preferably in git bash if windows). Directory must be set to: /mars_rover_tech_challenge

* Other versions of gems may be used, but ensure sqlite3 gem is set to '1.3.13' and installed

* Start the Rails server in directory /mars_rover_tech_challenge. Use 'rails s' to start the server on your localhost. Default URL is [http://localhost:3000/](http://localhost:3000/)

* Load the website using URL: [http://localhost:3000/](http://localhost:3000/) and proceed with instructions.

To run the rspec tests:

* Directory must be set to /mars_rover_tech_challenge

* Ensure bundle install was successful (Requires rspec Gem)

* Run: 'ruby mars_rover_runner.rb'

* Results will be printed out to the command line where it is being run.
