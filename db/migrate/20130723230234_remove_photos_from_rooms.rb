class RemovePhotosFromRooms < ActiveRecord::Migration
  def up
    remove_column :rooms, :breakfast
    remove_column :rooms, :photo_file_name
    remove_column :rooms, :photo_content_type
    remove_column :rooms, :photo_file_size
    remove_column :rooms, :photo_updated_at
  end

  def down
    add_column :rooms, :photo_updated_at, :string
    add_column :rooms, :photo_file_size, :string
    add_column :rooms, :photo_content_type, :string
    add_column :rooms, :photo_file_name, :string
    add_column :rooms, :breakfast, :string
  end
end
