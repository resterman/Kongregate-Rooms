class CreateRoomStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :room_statuses do |t|
      t.datetime :created_at
      t.integer :total_user_count
      t.integer :registered_user_count
      t.boolean :joinable
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
