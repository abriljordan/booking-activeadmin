# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # Displaying recent room bookings
    columns do
      column do
        panel "Recent Room Bookings" do
          ul do
            Booking.order(created_at: :desc).limit(5).map do |booking|
              li link_to("#{booking.room.name} booked by #{booking.admin_user.email}", admin_booking_path(booking))
            end
          end
        end
      end

      column do
        panel "Room Booking Statistics" do
          para "Total Bookings: #{Booking.count}"
          para "Rooms Available: #{Room.where(available: true).count}"
          para "Total Users: #{AdminUser.count}"
        end
      end
    end

    # Display bookings by month chart
    columns do
      column do
        panel "Bookings by Month" do
          bookings_by_month = Booking.group_by_month(:created_at, format: "%B %Y").count
          line_chart bookings_by_month
        end
      end
    end
  end
end