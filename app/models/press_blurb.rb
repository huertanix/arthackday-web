class PressBlurb < ActiveRecord::Base
  belongs_to :event
  attr_accessible :headline, :source_name, :source_url, :logo_uri, :featured
end
