class AddFeaturedVideoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :featured_video, :string
  end
end
