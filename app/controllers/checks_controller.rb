class ChecksController < ApplicationController
  def create
    request_room = Room.find(params[:room_id])
    if request_room.available
      check_in(request_room)
      render json: {message: "Successful reservation"}, status: :ok
    else
      render json: {message: "The room already has taken"}, status: :error
    end
  end

  def update
    check_out
    render json: {
      message: "Succesful check out",
      total: calculate_end_price,
      rate_per_day: @check.room.daily_rate,
      extra_costs: @check.extra,
      member_discount: @check.discount
    }, status: :ok
  end

  private

  def check_in(room)
    room.update(available: false)
    Check.create(check_in_params)
  end

  def check_in_params
    params.permit(:room_id, :guest_id, :initial_date, :end_date)
  end

  def check_out
    @check = Check.find(params[:id])
    @check.update(status: :closed)
    @check.room.update(available: true)
  end

  def calculate_end_price
    total_days = (@check.end_date.to_date - @check.initial_date.to_date).to_i
    total = (@check.room.daily_rate * total_days)
    total - (total * (@check.discount / 100.0)) + @check.extra
  end
end
