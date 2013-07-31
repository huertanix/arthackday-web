class AddLongitudeToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :longitude, :float, :precision => 15, :scale => 10
  end
end
