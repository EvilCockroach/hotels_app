class Room < ActiveRecord::Base
  attr_accessible :hotel_id, :price, :room_type, :breakfast
  belongs_to :hotel
end
