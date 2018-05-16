class Room < ApplicationRecord
  has_many :reservations, through: :reservation2_rooms
  has_many :comments, as: :commentable
end
