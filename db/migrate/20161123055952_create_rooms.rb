class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :room_id
      t.boolean :premium_only
      t.string :owner
      t.string :language
      t.string :description

      t.timestamps
    end
  end
end
