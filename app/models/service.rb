class Service < ApplicationRecord
  has_many :reservations, through: :reservation2_services
  has_many :comments, as: :commentable
end
