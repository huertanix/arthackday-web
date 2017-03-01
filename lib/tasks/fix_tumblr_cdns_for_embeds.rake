namespace :arthackday do
  desc "Change CDN URL for featured thumbnail photos using 24, 31, 37 etc to use 36."
  task :fix_tumblr_cdns_for_embeds => :environment do
    Medium.all.each do |medium|
      if medium.snippet.include?("//24.media.tumblr.com")
        new_img_snippet = medium.snippet.gsub('//24','//38')
        medium.snippet = new_img_snippet
        puts medium.snippet
        medium.save!
      elsif medium.snippet.include?("//25.media.tumblr.com")
        new_img_snippet = medium.snippet.gsub('//25','//38')
        medium.snippet = new_img_snippet
        puts medium.snippet
        medium.save!
      elsif medium.snippet.include?("//31.media.tumblr.com")
        new_img_snippet = medium.snippet.gsub('//31','//38')
        medium.snippet = new_img_snippet
        puts medium.snippet
        medium.save!
      elsif medium.snippet.include?("//37.media.tumblr.com")
        new_img_snippet = medium.snippet.gsub('//37','//38')
        medium.snippet = new_img_snippet
        puts medium.snippet
        medium.save!
      elsif medium.snippet.include?("//28.media.tumblr.com")
        new_img_snippet = medium.snippet.gsub('//28','//38')
        medium.snippet = new_img_snippet
        puts medium.snippet
        medium.save!
      elsif medium.snippet.include?("//28.media.tumblr.com")
        new_img_snippet = medium.snippet.gsub('//36','//38')
        medium.snippet = new_img_snippet
        puts medium.snippet
        medium.save!
      end
    end
  end
end