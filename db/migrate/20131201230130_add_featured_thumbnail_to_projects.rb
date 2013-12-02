class AddFeaturedThumbnailToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :featured_thumbnail, :string
  end
end
