class AddEventIdToPressBlurbs < ActiveRecord::Migration
  def change
    add_column :press_blurbs, :event_id, :reference
  end
end
