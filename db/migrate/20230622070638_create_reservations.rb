class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :rcheck_out
      t.integer :count
      t.string :room_id
      t.string :user_id

      
      t.string :reserve_date
      t.string :name
      t.string :note

      t.timestamps
    end
  end
end
