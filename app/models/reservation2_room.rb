class Reservation2Room < ApplicationRecord
  belongs_to :reservation
  belongs_to :room
end
