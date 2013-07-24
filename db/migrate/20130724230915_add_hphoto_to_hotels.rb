class AddHphotoToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :hphoto, :string
  end
end
