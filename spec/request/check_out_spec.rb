require 'rails_helper'

RSpec.describe "Check out management", type: :request do
  describe "GET /rooms" do
    context "There are available rooms" do
      it "Should return the list of avaliable rooms" do
        room1 = Room.create(daily_rate: 20000, available: true)
        room2 = Room.create(daily_rate: 40000, available: false)
        room3 = Room.create(daily_rate: 30000, available: true)
        room4 = Room.create(daily_rate: 20000, available: true)

        get "/rooms"
        json = JSON.parse(response.body)
        expect(json).to match_array([{"id"=> room1.id, "daily_rate" => 20000.0}, {"id" => room3.id, "daily_rate" => 30000.0}, {"id" => room4.id, "daily_rate" => 20000.0}])
        expect(json.size).to eq(3)
      end
    end
  end
  describe "POST /rooms" do
    context "The user give its information and room data" do
      it "Should create room request" do
        room = Room.create(daily_rate: 20000, available: true)
        guest = Guest.create(name: "Guest 1", member_tier: "tier 1")

        post "/rooms", params: {room_id: room.id, guest_id: guest.id, initial_date: Date.new(2019, 2, 1), final_date: Date.new(2019, 2, 5)}
        json = JSON.parse(response.body)
        expect(json["message"]).to eq("Successful reservation")
      end
    end
  end
end
