class AddHeaderImageTiledToEvent < ActiveRecord::Migration
  def change
    add_column :events, :header_image_tiled, :boolean
  end
end
