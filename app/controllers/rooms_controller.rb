class RoomsController < ApplicationController
  def index
    available_rooms = Room.where(available: true).select(:id, :daily_rate)
    render json: available_rooms, status: :ok
  end

  def create
    request_room = Room.find(params[:room_id])
    if request_room.available
      render json: {message: "Succesful reservation"}, status: :ok
    else
      render json: {message: "The room already has taken"}, status: :error
    end
  end
end
