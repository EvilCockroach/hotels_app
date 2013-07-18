class AddRatescountColumnToHotels < ActiveRecord::Migration
  def change 
    add_column :hotels, :rates_count, :integer
   end
end
