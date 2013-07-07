class AddEventRefToPressBlurbs < ActiveRecord::Migration
  def change
    add_column :press_blurbs, :event, :reference
  end
end
