class RemoveUserIdFromBookings < ActiveRecord::Migration[7.2]
  def change
    remove_column :bookings, :user_id
  end
end
