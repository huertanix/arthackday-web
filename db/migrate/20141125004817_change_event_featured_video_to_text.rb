class ChangeEventFeaturedVideoToText < ActiveRecord::Migration
  def change
    change_column :events, :featured_video, :text, :limit => nil
  end
end
