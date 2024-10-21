class Room < ApplicationRecord

has_many :bookings, dependent: :destroy

 def self.ransackable_attributes(auth_object = nil)
    ["capacity", "created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["bookings"]
  end
  
   def self.ransackable_attributes(auth_object = nil)
    %w[name capacity available] # Ensure available is included
  end
  
end
