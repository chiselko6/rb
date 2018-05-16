class Room < ApplicationRecord
  has_many :reservations, through: :reservation2_rooms
end
