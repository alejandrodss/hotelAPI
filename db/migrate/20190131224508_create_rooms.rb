class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.float :daily_rate, default: 0, null: false
      t.boolean :available, default: true, null: false
    end
  end
end
