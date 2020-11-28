class Sponsor < ApplicationRecord
  belongs_to :event
  #attr_accessible :name, :website, :logo, :featured
  has_attached_file :logo, :styles => { :thumb => "300x200>", :chibi => "100x75>" }, :default_url => "http://placekitten.com/300/200", s3_permissions: "public-read"
  validates_attached_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  scope :featured_in_about, -> { where(:featured => true) }
end