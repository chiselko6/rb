class User < ApplicationRecord
  has_many :reservations

  def total_booked_price
    reservations.inject(0) { |sum,r| sum + r.total_cost }
  end

  def total_saved_by_promo
    reservations.inject(0) { |sum,r| sum + r.total_promo }
  end

  def has_promo?
    total_booked_price >= 500
  end
end
