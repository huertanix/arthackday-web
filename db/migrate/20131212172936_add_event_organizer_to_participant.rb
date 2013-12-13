class AddEventOrganizerToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :event_organizer, :boolean
  end
end
