class User < ApplicationRecord
  has_many :services
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def provider_bookings
    services.map { |service| service.bookings}.flatten
  end

end

# provider_bookings = current_user.services.map do |service|
#       service.provide_bookings
#     end
#     provider_bookings
#   end
