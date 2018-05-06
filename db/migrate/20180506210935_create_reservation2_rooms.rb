class CreateReservation2Rooms < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation2_rooms do |t|
      t.references :reservation, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
