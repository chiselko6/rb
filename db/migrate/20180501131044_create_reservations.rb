class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.date :date_in
      t.date :date_out

      t.timestamps
    end
  end
end
