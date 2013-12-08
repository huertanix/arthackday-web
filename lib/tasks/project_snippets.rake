namespace :arthackday do
  desc "Find media embedded in project descriptions and move them into their own project media snippets."
  task :copy_project_description_snippets  => :environment do
    require 'nokogiri'
    
    Project.all.each do |project|
      if project.description.include? "<iframe "
        description_html = Nokogiri::HTML(project.description)
        description_html.css('iframe').each do |iframe|
          puts iframe.to_s

          @medium = Medium.new
          @medium.project_id = project.id
          @medium.snippet = iframe.to_s
          @medium.save
        end
      end
    end
  end

  desc "Find media embedded in project descriptions and ruthlessly delete."
  task :purge_project_description_iframes  => :environment do
    require 'nokogiri'
    
    Project.all.each do |project|
      if project.description.include? "<iframe "
        description_html = Nokogiri::HTML(project.description)
        description_html.css('iframe').remove
        puts description_html.to_s

        project.description = description_html.to_s
        project.save
      end
    end
  end
end