namespace :arthackday do
  desc "FriendlyID sometimes adds shit at the end of slugs. This removes that shit."
  task :clean_slugs  => :environment do
    Project.all.each do |project|
      project.slug = nil
      project.save!
      puts "New project slug: #{project.slug}"
    end
    
    Event.all.each do |event|
      event.slug = nil
      event.save!
      puts "New event slug: #{event.slug}"
    end
  end
end