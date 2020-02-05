class AddNewFieldsToChecks < ActiveRecord::Migration[5.1]
  def up
    add_column :checks, :discount, :integer, default: 0
    add_column :checks, :extra, :integer, default: 0
    add_column :checks, :status, :integer, default: 0
  end

  def down
    remove_column :checks, :discount, :integer
    remove_column :checks, :extra, :integer
    remove_column :checks, :status, :integer
  end
end
