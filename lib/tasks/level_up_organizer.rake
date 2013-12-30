namespace :arthackday do
  desc "Gives the organizer of your choice god-mode powers (org admin level privileges)."
  task :level_up_organizer, [:email] => :environment do |t, args| # no idea why brackets need to be around :email
    organizer = Organizer.find_by email: args[:email]
    if organizer.nil?
      puts "Organizer with email address #{args[:email]} could not be found."
    else
      organizer.org_admin = true
      organizer.save!
      puts "Organizer successfully leveled up to org admin."
    end
  end
end