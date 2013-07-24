class Room < ActiveRecord::Base
  attr_accessible :hotel_id, :price, :room_type, :room_number, :breakfast_included, :photo
  mount_uploader :photo, PhotoUploader
  belongs_to :hotel
  #has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
  # :default_url => "/images/:style/missing.png",
  # :path => ":rails_root/public/:style/:id/:basename.:extension"
end
