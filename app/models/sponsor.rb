class Sponsor < ApplicationRecord
  belongs_to :event
  #attr_accessible :name, :website, :logo, :featured
  has_attached_file :logo, :styles => { :thumb => "300x200>", :chibi => "100x75>" }, :default_url => "http://placekitten.com/300/200"

  scope :featured_in_about, -> { where(:featured => true) }
end