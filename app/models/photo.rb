class Photo < ApplicationRecord
  belongs_to :projects
  #attr_accessible :image, :credit, :project_id

  has_attached_file :image, :styles => { :medium => "600x400", :thumb => "300x200>", :chibi => "100x75>" }, s3_permissions: "public-read"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
