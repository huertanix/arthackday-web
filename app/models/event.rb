class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :projects
  has_many :press_blurbs
  has_many :sponsors
  has_and_belongs_to_many :participants
  has_and_belongs_to_many :organizers
  # venue might not work here?
  accepts_nested_attributes_for :projects, :press_blurbs, :sponsors, :participants, allow_destroy: true
  # protect from hax
  attr_accessible :city, :theme, :hackathon_start, :hackathon_end, :show_start, :show_end, :about, 
  :hack_rsvp_url, :show_rsvp_url, :press_blurbs_attributes, :projects_attributes, :sponsors_attributes, :venue_id
end
