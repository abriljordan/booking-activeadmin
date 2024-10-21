class ChangeUserIdToAdminUserIdInBookings < ActiveRecord::Migration[7.2]
  def change
    remove_column :bookings, :user_id, :integer
    add_column :bookings, :admin_user_id, :integer, null: false
    add_index :bookings, :admin_user_id
    # Add foreign key constraint
    add_foreign_key :bookings, :admin_users, column: :admin_user_id
  end
end
