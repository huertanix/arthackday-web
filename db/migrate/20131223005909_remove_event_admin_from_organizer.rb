class RemoveEventAdminFromOrganizer < ActiveRecord::Migration
  def change
    remove_column :organizers, :event_admin, :boolean
  end
end
