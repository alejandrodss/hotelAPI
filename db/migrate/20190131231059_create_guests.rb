class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :member_tier
    end
  end
end
