class RemoveBreakfastIncludeFromRooms < ActiveRecord::Migration
  def change
    remove_column :rooms, :breakfast_included?, :boolean
  end

  def up
  end

  def down
  end
end
