class Sponsor < ActiveRecord::Base
  belongs_to :event
  attr_accessible :name, :website, :logo_uri
end