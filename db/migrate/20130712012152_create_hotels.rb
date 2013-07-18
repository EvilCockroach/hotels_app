class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.float :star_rating
      t.integer :address_id

      t.timestamps
    end
  end
end
