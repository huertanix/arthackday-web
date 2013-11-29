class Sponsor < ActiveRecord::Base
  belongs_to :event
  attr_accessible :name, :website, :logo
  has_attached_file :logo, :styles => { :thumb => "300x200>", :chibi => "100x75>" }, :default_url => "http://placekitten.com/300/200"
end