class AddEventRefToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :event, :reference
  end
end
