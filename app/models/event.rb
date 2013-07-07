class Event < ActiveRecord::Base
  has_one :venue
  has_many :projects
  has_many :press_blurbs
  has_many :sponsors
  has_and_belongs_to_many :participants
end
