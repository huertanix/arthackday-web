class RemoveLogoUriFromSponsors < ActiveRecord::Migration
  def change
    # FYI this didn't work when I ran it.
    remove_column :sponsors, :logo_uri, :string
  end
end
