class AddBreakfastIncludedToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :breakfast, :integer
  end
end
