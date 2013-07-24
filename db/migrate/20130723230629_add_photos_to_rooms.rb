class AddPhotosToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :photo, :string
  end
end
