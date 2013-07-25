class CreateJoinTableEventVenue < ActiveRecord::Migration
  def change
    create_join_table :events, :venues do |t|
      # t.index [:event_id, :venue_id]
      # t.index [:venue_id, :event_id]
    end
  end
end
