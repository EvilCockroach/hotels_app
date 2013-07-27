class HotelsController < ApplicationController
  def index
    
    @hotels = Hotel.order('star_rating/rates_count DESC')
    @hotelsordered = @hotels.limit(5)
    @otherhotels = @hotels.reverse[0..(@hotels.count - 6)].sort_by{|h| h.title}
    
  end

  def show
    @hotel = Hotel.find(params[:id])
    #This piece of code was created to have commas between
    #address parts and don't have it at the end of line as 
    #it would be using simple loop in view
   @address_attr = Address.find_by_hotel_id(params[:id])
   @address2 = []
     if !@address_attr.nil? then 
                      @address_t = {"country" => @address_attr.attributes['country'],
                "state" => @address_attr.attributes['state'],
                "city" => @address_attr.attributes['city'],
                "street" => @address_attr.attributes['street'] }
    
    @address_t.each do  |a,b|  
      if !b.blank? then @address2.push(b)
      end
        end
      @address = @address2.join(", ")
    end
      ############################
      # I didnt know how to organize correctly many-to-many connection,
      # so decided to save UserHotel separately from 
  @userhotel = UserHotel.find_all_by_hotel_id(params[:id])
  @curruserhotel = UserHotel.find_by_hotel_id_and_user_id(params[:id],current_user.id)
   #used for having less code in view
   @rating = !@curruserhotel.nil? ? @curruserhotel[:rating] : 0
  
  
end
 

  def new
    @hotel = Hotel.new
    @address = Address.new
    @userhotel = UserHotel.new
  end

  def create

    @hotel = Hotel.new(params[:hotel].merge(:star_rating => params[:user_hotel][:rating], :rates_count => 1))
    @hotel.address = Address.new(params[:address])
    @hotel.hphoto = params[:hotel][:hphoto]
      
  if @hotel.save
    @user_hotel = UserHotel.new(params[:user_hotel].merge(:hotel_id => @hotel[:id], :user_id => current_user.id))
    @user_hotel.save
    
    flash[:success] = "New hotel was added. Thank you"
    redirect_to @hotel
  else
    render :action => 'new'
  end
end

def edit
  @hotel = Hotel.find(params[:id])

  @userhotel = UserHotel.find_by_hotel_id_and_user_id(params[:id], current_user.id)
  if !@userhotel.blank?  then                     
                       @mark = @userhotel[:rating] end
  @address = Address.find_by_hotel_id(params[:id])
  
end

def update 

  @hotel = Hotel.find(params[:id])
  
@userhotel = UserHotel.find_by_hotel_id_and_user_id(params[:id], current_user.id)
@hotel.star_rating += (params[:radiobutton]).to_i
@hotel.address = Address.find_by_hotel_id(params[:id])
if !@userhotel.blank?
 @hotel.star_rating -= (@userhotel[:rating]).to_i
else
 @userhotel = UserHotel.new(:rating => params[:radiobutton].to_i, :hotel_id => params[:id], :user_id => current_user.id, :comment => params[:user_hotel][:comment])
end

  if (@hotel.update_attributes(:title => params[:hotel][:title], :star_rating => @hotel.star_rating, :hphoto => params[:hotel][:hphoto]) 
     @hotel.address.update_attributes(params[:address])
  @userhotel.update_attributes(:rating => params[:radiobutton].to_i, :hotel_id => params[:id], :user_id => current_user.id, :comment => params[:user_hotel][:comment]))

    flash[:success] = "Information updated"
    redirect_to @hotel
  else
    @hotel.star_rating += @user_hotel.rating
    render 'edit'
  end
end



end
