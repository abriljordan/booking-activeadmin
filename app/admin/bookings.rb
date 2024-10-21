ActiveAdmin.register Booking do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :room_id, :user_id, :start_time, :end_time
  #
  # or
  #
  # permit_params do
  #   permitted = [:room_id, :user_id, :start_time, :end_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  # Permit parameters to include admin_user_id instead of user_id
  permit_params :room_id, :admin_user_id, :start_time, :end_time

  index do
    selectable_column
    id_column
    column :room
    column :"Admin User", :admin_user, accessor: :email  # Ensure this is showing the correct association
    column :start_time
    column :end_time
    actions
  end

  form do |f|
    f.inputs do
      f.input :room
      f.input :admin_user  # Ensure this is using admin_user association
      f.input :start_time, as: :datetime_picker
      f.input :end_time, as: :datetime_picker
    end
    f.actions
  end

end
