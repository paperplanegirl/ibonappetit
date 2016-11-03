class RemoveColumnFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :user_id, :string
  end
end
