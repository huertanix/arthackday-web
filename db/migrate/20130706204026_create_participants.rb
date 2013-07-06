class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :bio
      t.string :twitter_handle
      t.string :website

      t.timestamps
    end
  end
end
