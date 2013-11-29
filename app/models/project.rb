class Project < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :participants

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :description, :tag, :website, :github, :participant_ids, :event_id, :main_image
  has_attached_file :main_image, :styles => { :medium => "600x400", :thumb => "300x200>", :chibi => "100x75>" }, :default_url => "http://placekitten.com/300/200"


end
