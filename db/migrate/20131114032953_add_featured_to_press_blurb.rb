class AddFeaturedToPressBlurb < ActiveRecord::Migration
  def change
    add_column :press_blurbs, :featured, :boolean
  end
end
