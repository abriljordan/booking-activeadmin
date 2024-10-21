class AddAvailableToRooms < ActiveRecord::Migration[7.2]
  def change
    add_column :rooms, :available, :boolean
  end
end
