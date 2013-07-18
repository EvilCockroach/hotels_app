class UserHotel < ActiveRecord::Base
  attr_accessible :comment, :rating, :user_id, :hotel_id
  belongs_to :user
  belongs_to :hotel
end
