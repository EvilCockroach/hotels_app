class CreateUserHotels < ActiveRecord::Migration
  def change
    create_table :user_hotels do |t|
      t.integer :user_id
      t.integer :hotel_id
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
