class Reservation2Room < ApplicationRecord
  belongs_to :reservation
  belongs_to :room

  def price
    room.price * (100 - (promo || 0)) / 100
  end

  def calculate_percentage_promo
    if reservation.user.total_booked_price >= 500
      20
    else
      0
    end
  end
end
