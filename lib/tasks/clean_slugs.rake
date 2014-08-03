namespace :arthackday do
  desc "FriendlyID sometimes adds shit at the end of slugs. This removes that shit."
  task :clean_slugs  => :environment do
    Project.all.each do |project|
      project.slug = nil
      project.save!
      puts "New slug: #{project.slug}"
    end
  end
end