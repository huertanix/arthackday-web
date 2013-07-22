class Event < ActiveRecord::Base
  has_one :venue
  has_many :projects
  has_many :press_blurbs
  has_many :sponsors
  has_and_belongs_to_many :participants
  has_and_belongs_to_many :organizers

  accepts_nested_attributes_for :venue, :projects, :press_blurbs, :sponsors, :participants

end
