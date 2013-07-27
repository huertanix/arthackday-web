class AddEventIdToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :event_id, :reference
  end
end
