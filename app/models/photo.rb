class Photo < ActiveRecord::Base
  belongs_to :projects
  attr_accessible :credit, :project_id
end
