class AddColumnsToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :partner_id, :integer
    add_column :reservations, :partner_accepted, :boolean
    add_column :reservations, :reservation_date, :datetime
  end
end
