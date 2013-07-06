class CreatePressBlurbs < ActiveRecord::Migration
  def change
    create_table :press_blurbs do |t|
      t.string :headline
      t.string :source_name
      t.string :source_url
      t.string :logo_uri

      t.timestamps
    end
  end
end
