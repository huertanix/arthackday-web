class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :subdivision
      t.string :country
      t.string :postal_code
      t.string :website

      t.timestamps
    end
  end
end
