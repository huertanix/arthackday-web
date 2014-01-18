namespace :arthackday do
  desc "Grabs old profile pics from participants and saves them to S3."
  task :update_participant_photos  => :environment do
    #require 'json'
    #require 'net/http'
    require 'rubygems'
    require 'open-uri'
    ###require 'aws/s3'
    
    s3_base_url = "https://s3-us-west-1.amazonaws.com/arthackday/participants/avatars/"

    Participant.all.each do |participant|
      #if participant.twitter_handle?
        #response = Net::HTTP.get_response(URI.parse("https://api.twitter.com/1.1/users/show.json?screen_name=huertanix"))
        
        #data = response.body
        #result = JSON.parse(data)
        #participant.photo_url = result.profile_image_url
        #puts participant.photo_url
        #participant.save!
      #else
      #  puts "This participant is not on the twitters: #{participant.name}"
      #end

      #amazon = AWS::S3::Service.new(access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'])
      #bucket = amazon.buckets.find(ENV['S3_BUCKET_NAME'])
      
      if participant.photo_url?
        # Download the file before doing anything else, also rename here
        file_name = "#{participant.name.gsub(/ /,"-")}.jpg"
        puts "#{Rails.root}/public/img/temp/#{file_name}"
        ###File.open("#{Rails.root}/public/img/temp/#{file_name}", 'wb') do |fo|
        File.open("#{Rails.root}/public/img/temp/#{file_name}", 'wb') do |fo|
          fo.write open(participant.photo_url, "User-Agent" => "Ruby/#{RUBY_VERSION}") # THIS CORRUPTS THE IMAGES AND MAKES THE FILES USELESS
        end

        #Net::HTTP.start("farm1.static.flickr.com") do |http|
        #  resp = http.get("/92/218926700_ecedc5fef7_o.jpg")
        #  open("fun.jpg", "w") { |file| file.write(resp.body) }
        #end

        # only thing that works
        ##s3 = AWS::S3.new(:access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])
        s3 = AWS::S3.new(:access_key_id => 'AKIAITBMWQFO745DO7EQ', :secret_access_key => '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')
        # S3 gem handles escaping weird filenames to something URL-friendly
        s3.buckets[ENV['S3_BUCKET_NAME']].objects["participants/avatars/#{file_name}"].write(:file => "#{Rails.root}/public/img/temp/#{file_name}")
        # overwrite the old URL with the S3 (public?) URL
        #participant.photo_url = s3.buckets[ENV['S3_BUCKET_NAME']].objects["participants/avatars/#{file_name}"].url #ugh
        #participant.photo_url = AWS::S3::S3Object.url_for("participants/avatars/#{file_name}", ENV['S3_BUCKET_NAME']) #why
        participant.photo_url = s3_base_url + file_name #idgaf
        ###participant.save!
        puts "New URL for #{participant.name}'s photo: #{participant.photo_url}"
      else
        puts "#{participant.name} does not have a photo_url"
      end
    end
  end
end