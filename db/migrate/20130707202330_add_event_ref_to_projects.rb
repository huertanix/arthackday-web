class AddEventRefToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :event, :reference
  end
end
