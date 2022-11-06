arthackday-web
==============

Art Hack Day website.

Install
-------

System Prereqs (Debian/Ubuntu/Mint):

* libreadline6
* libreadline6-dev
* sqlite3
* libsqlite3-dev
* postgresql-9.1 NOTE: This is apparently required even though it is only needed in production
* postgresql-server-dev-9.1
* [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

Ruby Prereqs:

* rvm
* Ruby 2.6.6 (`rvm install ruby-2.6.6`)
* Rails (5.2.8.1)
* NB: if you have several rubies installed, you may need to switch to the right one. To see which rubies you have installed type `rvm list` and switch to 2.6.6 with `rvm use 2.6.6`
* NB NB: If you already have 2.6.6 installed, the Gemfile will now automatically use that one.

Application Install:

* bundle install --without production
* rake db:migrate
* rails s
* open the app on <http://localhost:3000/>

Getting Started
---------------

You will want to clone from Github (not Heroku) and then add the Heroku staging instance as a remote to push changes to http://arthackday-staging.herokuapp.com, where changes can be previewed in a way that's nearly idential to the live site. To do that, run these commands on your machine:

    git clone https://github.com/huertanix/arthackday-web.git arthackday-staging
    heroku git:remote -a arthackday-staging
    heroku keys:add

To push to staging, type this from inside the arthackday-staging directory:

    git push heroku master

Create an organizer account if you don't have one by going to /admin and registering. You will need the latest secret invite code to register. By default, an organizer has no ability to edit things tied to a specific event, so for your local development environment, you'll want to bump yourself to org-level admin. You can do so for your dev environment by running this rake task from inside arthackday-staging:

    heroku run rake arthackday:level_up_organizer[emailyouusedtoregister@whatevs.com]

Most admin functionality hasn't been stitched together into a cohesive user experience yet. To add a new venue, participant, or project, navigate to /admin and navigate to the list of any of those things and click edit. To edit an event, go to /events after logging in as an admin and click the special New Event link visible only to organizers.

Getting the latest data from Heroku Postgres
--------------------------------------------

To get the latest and greatest data from production into your local build to test and develop with, you'll want to follow these several steps:

For macOS:

Download and install Postgres 9.1 or above

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Once brew is installed, run this to install postgres:

    brew doctor
    brew update
    brew install postgres

There might be some additional steps needed if you want to run postgres on startup, see: <http://stolho.com/2013/04/01/how-to-install-postgresql-9-on-mac-os-x/> for deets.

For Debian/Ubuntu:

    sudo apt-get install postgresql-9.1 postgresql-client-9.1

Once you have postgres installed, you can manage postgres through the command line like some sort of ancient rite of passage or you can install pgAdmin.

For macOS:

Go to <http://www.pgadmin.org/download/macosx.php>, download the latest dmg and follow the installer's instructions.

For Debian/Ubuntu:

    sudo apt-get install pgadmin3

Postgres *should* create a default "postgres" user without a password to log into pgAdmin with. Rails doesn't seem to like logging into pg without a password, so you'll want to create one with a password, typically named the same as your system's login username. Right click on Login Roles and click New login role. Check off all privileges except Can create roles.

After creating your user, create a database and name it "arthackday-development" with that user as the DB owner.

Once you have an empty arthackday-development database owned by the user you made, download a dump of the latest data from production from inside the arthackday-website project drectory:

    heroku pgbackups:capture
    curl -o latest.dump `heroku pgbackups:url`

Then restore it into your local pg database:

    pg_restore --verbose --clean --no-acl --no-owner -h localhost -U myuser -d arthackdayweb_development latest.dump

Congrats! Now you have an exact copy of the production database on your manchine. To wire it up to Rails you'll want to edit Gemfile by uncommenting the 'pg' gem in the :development group:

    gem 'pg'

You'll also want to edit config/database.yml and comment out the sqlite adapter and database under :development so that it looks like this:

    ##adapter: sqlite3
    adapter: postgresql
    ##database: db/development.sqlite3
    database: arthackdayweb_development
    encoding: utf8
    username: yourpostgresusername
    password: yourpostgrespassword
    pool: 5
    timeout: 5000

Stop rails if it's running and run `rake db:migrate`. Start rails again and you should see the site with the data from the postgres dump. Yay!

*IMPORTANT!* Before committing a change to Github, put the config/database.yml back to its original state, otherwise people not running postgres with your username and password will have to change this back to sqlite every time they pull:

    git checkout config/database.yml

...restart Rails and run `rake db:migrate` again. Now both config/database.yml and db/schema.rb should no longer show up when you run `git status` and it should be safe to commit your changes.

Deploying to Staging
-----------------------

Assuming you have been assigned as a collaborator for arthackday-staging.herokuapp.com and you have installed [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli), push to staging by adding Heroku to your list of git remotes using this command and then pushing:

    git remote rm heroku
    heroku git:remote -a arthackday-staging
    git push heroku master

Refresh <http://arthackday-staging.herokuapp.com> and make sure it works.

Deploying to Production
-----------------------

Assuming you have been assigned as a collaborator for arthackday-website.herokuapp.com, you need to install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) and add Heroku to your list of git remotes using this command:

    heroku git:remote -a arthackday-website

(NB: if you've pushed to staging first you'll need to remove the remote pointing to staging first with this command "git remote rm heroku"). 

After the remote has been added, you can push your changes (after pulling the latest from Github and committing the changes you're made) with this command:

    git push heroku master

If your changes don't show up after deploying, treat the Heroku instance like a Windows 98 box and restart it with the following:

    heroku restart

If even that doesn't work, try clearing your cache and stuff.

LOLcense
--------

Unless where otherwise noted, this website is distributed under the Chicken Dance License (CDL). Please see the included copy of the license (CDL-LICENSE.txt) for deets and the included example instructions for the chicken dance (DANCE.txt). Video delivery may be conducted via electronic mail by sending a link to the video file directly or through an HTML5-based online viewer to arthackday at gmail dot com. Physical video delivery will only be accepted in *HD-DVD* or *Betamax* format and must be delivered to the following address:

> Art Hack Day
> c/o Gray Area Foundation
> 2665 Mission Street
> San Francisco, CA 94110

Logos and other digital artworks contained in this repository are owned by their respective owners and subject to their own less chickeny copyright rules.
