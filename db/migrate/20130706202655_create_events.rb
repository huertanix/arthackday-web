class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :city
      t.string :theme
      t.datetime :hackathon_start
      t.datetime :hackathon_end
      t.datetime :show_start
      t.datetime :show_end
      t.text :about
      t.string :hack_rsvp_url
      t.string :show_rsvp_url

      t.timestamps
    end
  end
end
