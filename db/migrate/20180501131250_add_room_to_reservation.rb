class AddRoomToReservation < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :rooms, foreign_key: true
  end
end
