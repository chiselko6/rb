class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.date :date_in
      t.date :date_out

      t.timestamps
    end
  end
end