 class RoomsController < ApplicationController

 def show
    @room = Room.find(params[:id])
  end

  def new
  	@room = Room.new
  end

  def create
    @room = Room.new(params[:room], :hotel_id => params(:id))
    if @room.save
    	flash[:success] = "New room was added"
      redirect_to @hotel_room
    else
      render 'new'
    end
  end

  end