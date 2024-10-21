ActiveAdmin.register Room do
  permit_params :name, :capacity, :available

  # Ensure the filter is defined explicitly as a boolean
  filter :name
  filter :capacity
  filter :available

  index do
    selectable_column
    id_column
    column :name
    column :capacity
    column :available
    actions
  end
end