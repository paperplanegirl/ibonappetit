class RemoveReservationIdFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :reservation_id, :integer
  end
end
