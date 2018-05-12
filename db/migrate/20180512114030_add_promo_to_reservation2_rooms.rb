class AddPromoToReservation2Rooms < ActiveRecord::Migration[5.2]
  def change
    add_column :reservation2_rooms, :promo, :integer
  end
end
