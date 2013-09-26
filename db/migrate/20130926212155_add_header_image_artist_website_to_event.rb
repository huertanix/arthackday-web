class AddHeaderImageArtistWebsiteToEvent < ActiveRecord::Migration
  def change
    add_column :events, :header_image_artist_website, :string
  end
end
