class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :name
      t.boolean :event_admin
      t.boolean :org_admin

      t.timestamps
    end
  end
end
