class AddPromoToReservation2Services < ActiveRecord::Migration[5.2]
  def change
    add_column :reservation2_services, :promo, :integer
  end
end
