class Organizer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :events

  # Setup accessible (or protected) attributes
  attr_accessor :invite_code
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :invite_code, :event_ids

  def can_edit_event?(event_id)
    self.org_admin? || self.event_ids.include?(event_id)
  end

  def allowed_events
    allowed_events = Array.new

    Event.all.sorted_by_date.each do |event|
      if self.can_edit_event? event.id
        allowed_events.push(event)
      end
    end

    return allowed_events
  end

  validates_each :invite_code, :on => :create do |record, attr, value|
    record.errors.add attr, "Please enter correct invite code" unless
      value && value == ENV["ORG_INVITE_CODE"]
  end
end
