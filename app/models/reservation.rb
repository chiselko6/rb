class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation2_services
  has_many :reservation2_rooms

  def total_cost
    cost_at_day date_in, date_out
  end

  def cost_at_day(date_from, date_to)
    date_from = date_from.to_date
    date_to = date_to.to_date
    day_range = ([date_to, date_out].min - [date_from, date_in].max).to_i + 1
    if day_range < 0
    then
      return 0
    else
      return reservation2_rooms.inject(0) { |sum,e| sum + e.room.price * day_range } + \
        reservation2_services.inject(0) { |sum,e| sum + (date_from == date_in ? e.service.price : 0) }
    end
  end
end
