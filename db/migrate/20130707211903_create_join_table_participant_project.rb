class CreateJoinTableParticipantProject < ActiveRecord::Migration
  def change
    create_join_table :participants, :projects do |t|
      # t.index [:participant_id, :project_id]
      # t.index [:project_id, :participant_id]
    end
  end
end
