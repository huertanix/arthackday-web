namespace :arthackday do
  desc "Change URL for featured thumbnail photos ending in _1280 to _500 so we get less gigantic photos from Tumblr."
  task :resize_tumblr_thumbs => :environment do
    Project.all.each do |project|
      unless project.featured_thumbnail.nil?
        if project.featured_thumbnail.include? "_1280"
          new_thumb_url = project.featured_thumbnail.gsub('_1280','_500')
          project.featured_thumbnail = new_thumb_url
          puts project.featured_thumbnail
          project.save!
        end
      end
    end
  end
end