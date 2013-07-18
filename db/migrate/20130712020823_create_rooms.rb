class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :hotel_id
      t.string :room_type
      t.float :price
      t.boolean :breakfast_included

      t.timestamps
    end
  end
end
