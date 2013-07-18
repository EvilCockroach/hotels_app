class Address < ActiveRecord::Base
  attr_accessible :city, :country, :state, :street
  belongs_to :hotel
end
