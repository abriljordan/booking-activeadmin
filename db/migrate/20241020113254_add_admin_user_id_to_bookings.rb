class AddAdminUserIdToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :admin_user_id, :integer, null: false
    add_index :bookings, :admin_user_id
    add_foreign_key :bookings, :admin_users
  end
end