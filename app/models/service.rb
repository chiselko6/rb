class Service < ApplicationRecord
  has_many :reservations, through: :reservation2_services
end
