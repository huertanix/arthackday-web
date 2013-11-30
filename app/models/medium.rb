class Medium < ActiveRecord::Base
  belongs_to :projects

  attr_accessible :snippet
end
