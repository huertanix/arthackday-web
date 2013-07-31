class AddLatitudeToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :latitude, :float, :precision => 15, :scale => 10
  end
end
