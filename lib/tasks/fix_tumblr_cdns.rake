namespace :arthackday do
  desc "Change CDN URL for featured thumbnail photos using 31 or 37 to use 36."
  task :fix_tumblr_cdns => :environment do
    Project.all.each do |project|
      unless project.featured_thumbnail.nil?
        if project.featured_thumbnail.include?("//24.media.tumblr.com")
          new_thumb_url = project.featured_thumbnail.gsub('//24','//36')
          project.featured_thumbnail = new_thumb_url
          puts project.featured_thumbnail
          project.save!
        elsif project.featured_thumbnail.include?("//25.media.tumblr.com")
          new_thumb_url = project.featured_thumbnail.gsub('//25','//36')
          project.featured_thumbnail = new_thumb_url
          puts project.featured_thumbnail
          project.save!
        elsif project.featured_thumbnail.include?("//31.media.tumblr.com")
          new_thumb_url = project.featured_thumbnail.gsub('//31','//36')
          project.featured_thumbnail = new_thumb_url
          puts project.featured_thumbnail
          project.save!
        elsif project.featured_thumbnail.include?("//37.media.tumblr.com")
          new_thumb_url = project.featured_thumbnail.gsub('//37','//36')
          project.featured_thumbnail = new_thumb_url
          puts project.featured_thumbnail
          project.save!
        elsif project.featured_thumbnail.include?("//36.media.tumblr.com")
          new_thumb_url = project.featured_thumbnail.gsub('//36','//38')
          project.featured_thumbnail = new_thumb_url
          puts project.featured_thumbnail
          project.save!
        end
      end
    end
  end
end