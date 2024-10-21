class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :admin_user, class_name: 'AdminUser' # Update this line

  validates :admin_user, presence: true
  
  validate :check_availability

  def check_availability
    overlapping_bookings = Booking.where(room_id: room_id)
                                  .where.not(id: id)
                                  .where('start_time < ? AND end_time > ?', end_time, start_time)
    if overlapping_bookings.exists?
      errors.add(:base, 'Room is not available for the selected time.')
    end
  end
  
def self.ransackable_attributes(auth_object = nil)
    %w[id room_id admin_user_id created_at updated_at] # Include admin_user_id
  end

  def self.ransackable_associations(auth_object = nil)
    %w[room admin_user] # Reference admin_user
  end

end
