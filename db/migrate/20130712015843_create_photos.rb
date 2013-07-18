class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :room_id
      t.string :link

      t.timestamps
    end
  end
end
