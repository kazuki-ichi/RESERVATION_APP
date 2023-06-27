class RoomsController < ApplicationController

  def new
    @room = Room.new
  end
 
  def create
    @room = Room.new(params.require(:room).permit(:name, :detail, :price, :image_path, :address, :user_id ,:content, :image))
    if @room.save
      redirect_to @room
    else
      render "new"
    end
  end

  def own
    @user = current_user
    @rooms = @user.rooms 
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def search_result 
    if params[:area].present?
      @rooms = Room.where("address like ?", "%#{params[:area]}%")
    elsif params[:keyword].present?
      @rooms = Room.where("name like ? OR detail like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    else 
     @rooms = Room.all
    end
  end

end
