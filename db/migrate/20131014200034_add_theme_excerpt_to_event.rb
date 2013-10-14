class AddThemeExcerptToEvent < ActiveRecord::Migration
  def change
    add_column :events, :theme_excerpt, :string
  end
end
