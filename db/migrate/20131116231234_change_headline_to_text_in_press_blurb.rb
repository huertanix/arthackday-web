class ChangeHeadlineToTextInPressBlurb < ActiveRecord::Migration
  def change
    change_column :press_blurbs, :headline, :text
  end
end
