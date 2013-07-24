 class RoomsController < ApplicationController

def index
    @room = Room.find_all_by_hotel_id(params[:hotel_id])
    @roomSortedByPrice = @room.sort_by{ |k| k["price"] }.reverse
    
    
  end

 def show
    @room = Room.find(params[:id])
  end

  def new
  	@room = Room.new
  end

  def create
   @newroomid = Room.find_all_by_hotel_id(params[:hotel_id]).count + 1
    @room = Room.new(params[:room].merge(:hotel_id => params[:hotel_id], :room_number => @newroomid) )
    @room.photo = params[:file]
    if @room.save
    	flash[:success] = "New room was added"
      redirect_to hotel_room_path(params[:hotel_id], @room.id)
    else
      render 'new'
    end
  end

  #def destroy
  #  redirect_to root_url
  #end

  end