class AddAssociationModer < ActiveRecord::Migration[5.1]
  def change
    create_table :checks do |t|
      t.integer :guest_id
      t.integer :room_id
      t.datetime :initial_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
