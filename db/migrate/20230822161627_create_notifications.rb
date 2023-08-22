class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :store
      t.string :model
      t.integer :inventory
      t.string :notification_status

      t.timestamps
    end
  end
end
