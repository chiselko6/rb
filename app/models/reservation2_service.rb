class Reservation2Service < ApplicationRecord
  belongs_to :reservation
  belongs_to :service
end
