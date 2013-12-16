class Event < ActiveRecord::Base
  extend FriendlyId
  belongs_to :venue
  has_many :projects
  has_many :press_blurbs
  has_many :sponsors
  has_and_belongs_to_many :participants
  has_and_belongs_to_many :organizers

  #attr_accessor :header_image_file 
  #attr_reader :header_image_file #ugh
  # fuck it I'll use paperclip #yolo
  #has_attached_file :header_image, :styles => { :medium => "300x300>", :thumb => "100x100>" } #, :default_url => "/images/:style/missing.png"

  # venue might not work here?
  accepts_nested_attributes_for :projects, :press_blurbs, :sponsors, :participants, allow_destroy: true
  # protect from hax
  attr_accessible :city, :theme, :hackathon_start, :hackathon_end, :show_start, :show_end, :about, 
  :hack_rsvp_url, :show_rsvp_url, :press_blurbs_attributes, :projects_attributes, :sponsors_attributes, 
  :venue_id, :header_image, :header_image_tiled, :header_image_artist, :header_image_artist_website, :theme_excerpt, 
  :featured_video, :featured_image, :header_dark_font, :organizer_section

  scope :sorted_by_date, order('hackathon_start desc') 

  friendly_id :theme, use: :slugged

  has_attached_file :featured_image, :styles => { :medium => "600x400", :thumb => "300x200>", :chibi => "100x75>" }, :default_url => "http://placekitten.com/600/400", s3_permissions: "public-read"

  def upcoming? 
    self.show_end > DateTime.now
  end

  #def should_generate_new_friendly_id?
  #  true
  #end
end