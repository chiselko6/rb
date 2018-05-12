class Reservation2Room < ApplicationRecord
  belongs_to :reservation
  belongs_to :room

  def price
    room.price * (100 - (promo || 0)) / 100
  end

  def starting_price
    room.price
  end

  def calculate_percentage_promo
    if reservation.user.has_promo?
      20
    else
      0
    end
  end
end
