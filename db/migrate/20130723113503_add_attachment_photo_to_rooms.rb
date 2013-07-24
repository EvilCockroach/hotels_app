class AddAttachmentPhotoToRooms < ActiveRecord::Migration
  def change
    change_table :rooms do |t|
      t.attachment :photo
    end
  end

end
