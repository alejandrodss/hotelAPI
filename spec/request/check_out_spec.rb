require 'rails_helper'

RSpec.describe "Rooms management", type: :request do
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
  describe "Checks management" do
    let(:room) { Room.create(daily_rate: 20000, available: true) }
    let(:guest) { Guest.create(name: "Guest 1", member_tier: :bronze) }

    describe "POST /checks" do
      context "The user give its information and room data" do
        it "Should create room request" do
          post "/checks", params: {room_id: room.id, guest_id: guest.id, initial_date: Date.new(2019, 2, 1), end_date: Date.new(2019, 2, 5)}
          json = JSON.parse(response.body)
          expect(json["message"]).to eq("Successful reservation")
        end
      end
    end
    describe "PUT /checks" do
      context "The user realises a check out for a check" do
        it "Update check, room status and give information about this check out" do
          check = Check.create(room: room, guest: guest, initial_date: Date.new(2020, 1, 20), end_date: Date.new(2020, 2, 5))
          put "/checks/#{check.id}"
          json = JSON.parse(response.body)
          expect(json["message"]).to eq("Succesful check out")
          expect(json["total"]).to eq(320000.0)
          expect(json["rate_per_day"]).to eq(20000)
          expect(json["extra_costs"]).to eq(0)
          expect(json["member_discount"]).to eq(0)
        end
      end
    end
  end
end
