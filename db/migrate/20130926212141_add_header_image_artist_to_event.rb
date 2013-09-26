class AddHeaderImageArtistToEvent < ActiveRecord::Migration
  def change
    add_column :events, :header_image_artist, :string
  end
end
