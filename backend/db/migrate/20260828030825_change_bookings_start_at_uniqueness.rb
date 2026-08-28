class ChangeBookingsStartAtUniqueness < ActiveRecord::Migration[8.0]
  def change
    remove_index :bookings, [:event_type_id, :start_at]
    add_index :bookings, :start_at, unique: true
  end
end
