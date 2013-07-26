class HotelsController < ApplicationController
  def index
    #@hotels = Hotel.all
    @hotels = Hotel.order('star_rating/rates_count DESC')
    @hotelsordered = @hotels.limit(5)
    @otherhotels = @hotels.reverse[0..(@hotels.count - 6)].sort_by{|h| h.title}
    #limit(@hotels.count - 5)
  end

  def show
    @hotel = Hotel.find(params[:id])
   @address_attr = Address.find_by_hotel_id(params[:id]).attributes
   @address_ = {"country" => @address_attr['country'],
                "state" => @address_attr['state'],
                "city" => @address_attr['city'],
                "street" => @address_attr['street'] }
    @address2 = []
    @address_.each do  |a|  
      if !a[1].blank? then @address2.push(a[1])
      end
        end
      @address2 = @address2.join(", ")
  @userhotel = UserHotel.find_all_by_hotel_id(params[:id])
  @rating = UserHotel.find_by_hotel_id_and_user_id(params[:id],current_user.id)[:rating]
   
  
  
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
