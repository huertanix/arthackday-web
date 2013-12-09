arthackday-web
==============

Art Hack Day website.

Install
-------
System Prereqs:

* libreadline6
* libreadline6-dev
* sqlite3
* libsqlite3-dev

Ruby Prereqs: 
* rvm
* Ruby 1.9.3, 
* gem install rails (4.0.0)
* NB: if you have several rubies installed, you may need to switch to the right one. To see which rubies you have installed type 'rvm list rubies' and switch to 1.9.3 with 'rvm ruby-1.9.3.p374'


Application Install:
* bundle install
* rake db:migrate
* rails s
* open the app on http://localhost:3000/

Getting Started
---------------
Most admin functionality hasn't been stitched together yet. To add a new venue, navigate to /admin and add a venue from the list there. Create an organizer account if you don't have one. To add a new event, navigate to /events and if you are logged in you should see a link to do that.


