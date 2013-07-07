class AddVenueRefToEvent < ActiveRecord::Migration
  def change
    add_column :events, :venue, :reference
  end
end
