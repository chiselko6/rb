class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation2_services
  has_many :reservation2_rooms

  def total_cost
    reservation2_rooms.inject(0) { |sum,e| sum + e.room.price } + \
      reservation2_services.inject(0) { |sum,e| sum + e.service.price }
  end
end
