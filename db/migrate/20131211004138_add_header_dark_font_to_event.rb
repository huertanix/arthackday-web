class AddHeaderDarkFontToEvent < ActiveRecord::Migration
  def change
    add_column :events, :header_dark_font, :boolean
  end
end
