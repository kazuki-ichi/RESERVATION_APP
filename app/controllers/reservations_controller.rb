class ReservationsController < ApplicationController
  
  def own
    #全て表示
    # @room = Room.all
    @user = current_user

    @reservations = @user.reservations #リレーションを定義することでこのような記述が可能

  end

  

  def new
    @reservation = Reservation.new
  end

  def back
    @room = Room.find(params[:reservation][:room_id])
		@reservation = Reservation.new(@attr)
		render  template: "rooms/show"
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in,	:rcheck_out,	:count, :room_id, :user_id,))
    if @reservation.invalid?
			redirect_to room_path(@reservation.room_id)
		end
	end

  def complete
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :rcheck_out, :count, :room_id, :user_id,))
    @reservation.save
    redirect_to :reservations_own
	end

    private

	def permit_params
		@attr = params.require('reservation').permit(:check_in, :rcheck_out, :count, :room_id, :user_id,)
	end

  
  def create
      @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :rcheck_out, :count, :room_id, :user_id,))

      if @reservation.save
        redirect_to :reservations
      else
        render "new"
      end
  end

  def show
  
  end

  def edit
  end
end