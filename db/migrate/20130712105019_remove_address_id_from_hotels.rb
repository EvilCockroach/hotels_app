class RemoveAddressIdFromHotels < ActiveRecord::Migration
  def change
    remove_column :hotels, :address_id, :integer
  end

  def up
  end

  def down
  end
end
