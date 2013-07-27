class AddIndexToHotelsTitle < ActiveRecord::Migration
  def change
  	add_index :hotels, :title, unique: true
  end
end
