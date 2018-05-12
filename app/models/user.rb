class User < ApplicationRecord
  has_many :reservations

  def total_booked_price
    reservations.inject(0) { |sum,r| sum + r.total_cost }
  end
end
