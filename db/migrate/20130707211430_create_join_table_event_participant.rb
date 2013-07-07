class CreateJoinTableEventParticipant < ActiveRecord::Migration
  def change
    create_join_table :events, :participants do |t|
      # t.index [:event_id, :participant_id]
      # t.index [:participant_id, :event_id]
    end
  end
end
