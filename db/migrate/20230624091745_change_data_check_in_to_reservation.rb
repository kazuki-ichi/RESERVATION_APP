class ChangeDataCheckInToReservation < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :check_in , :datetime
    change_column :reservations, :rcheck_out , :datetime
 
  end
end
