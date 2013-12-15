class Participant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  ##devise :database_authenticatable, :registerable,
  ##       :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  ##devise :database_authenticatable, :registerable,
  ##       :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :bio, :twitter_handle, :website, :photo_url, :event_ids

  has_and_belongs_to_many :events
  has_and_belongs_to_many :projects

  accepts_nested_attributes_for :events

  #scope :is_event_organizer, where(:event_organizer => true)

end
