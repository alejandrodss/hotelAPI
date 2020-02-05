class RoomsController < ApplicationController
  def index
    available_rooms = Room.where(available: true).select(:id, :daily_rate)
    render json: available_rooms, status: :ok
  end
end
