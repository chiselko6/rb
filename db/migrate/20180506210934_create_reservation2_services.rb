class CreateReservation2Services < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation2_services do |t|
      t.references :reservation, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
