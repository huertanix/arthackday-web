class RemoveEventOrganizerFromParticipant < ActiveRecord::Migration
  def change
    remove_column :participants, :event_organizer, :boolean
  end
end
