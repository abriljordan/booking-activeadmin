class AddDefaultToAvailableInRooms < ActiveRecord::Migration[7.2]
  def change
     def up
    # Set existing nil values to false
    Room.where(available: nil).update_all(available: false)

    # Now change the column to not allow null values and set default to false
    change_column_default :rooms, :available, false
    change_column_null :rooms, :available, false
  end

  def down
    change_column_default :rooms, :available, nil
    change_column_null :rooms, :available, true
  end
  end
end
