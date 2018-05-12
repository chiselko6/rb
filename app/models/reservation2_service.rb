class Reservation2Service < ApplicationRecord
  belongs_to :reservation
  belongs_to :service

  def price
    service.price * (100 - (promo || 0)) / 100
  end

  def starting_price
    service.price
  end

  def calculate_percentage_promo
    if reservation.user.has_promo?
      10
    else
      0
    end
  end
end
