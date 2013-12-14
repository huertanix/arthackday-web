class AddOrganizerSectionToEvent < ActiveRecord::Migration
  def change
    add_column :events, :organizer_section, :text
  end
end
