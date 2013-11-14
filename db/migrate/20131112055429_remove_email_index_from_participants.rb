class RemoveEmailIndexFromParticipants < ActiveRecord::Migration
  def change
    remove_index :participants, :name => 'index_participants_on_email'
  end
end
