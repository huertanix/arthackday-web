class Event < ActiveRecord::Base
  has_many :projects
  has_many :participants
  has_one :venue
end
