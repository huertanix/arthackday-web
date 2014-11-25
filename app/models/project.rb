class Project < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  has_many :medium
  has_many :photos
  has_and_belongs_to_many :participants

  accepts_nested_attributes_for :medium, :photos, allow_destroy: true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :description, :tag, :website, :github, :participant_ids, :event_id, :medium_attributes, :featured_thumbnail, :photos_attributes
  has_attached_file :main_image, :styles => { :large => "1200x800", :medium => "600x400", :thumb => "300x200>", :chibi => "100x75>" }

  friendly_id :participants_with_project_name, use: :slugged

  def participants_with_project_name
    participant_names = String.new

    self.participants.map do | participant |
      participant_names += participant.name + " "
    end

    "#{participant_names}#{self.name}"
  end

  #def should_generate_new_friendly_id?
  #  true
  #end
end