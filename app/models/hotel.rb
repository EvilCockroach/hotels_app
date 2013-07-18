class Hotel < ActiveRecord::Base
  attr_accessible :star_rating, :rates_count, :title
  has_one  :address
  has_many :user_hotels
  has_many :rooms
  has_many :users, through: :user_hotels
  	validates :title, presence: true, 
 					length: { maximum: 50 }
	
end
