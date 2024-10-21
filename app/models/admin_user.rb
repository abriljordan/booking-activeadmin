class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  has_many :bookings

  def to_s
    email # or any other attribute you'd like to display
  end
  
   def self.ransackable_attributes(auth_object = nil)
    # Allow only non-sensitive attributes to be searchable
    %w[id email created_at updated_at]
  end

end
