class AddBookingId < ActiveRecord::Migration
  def change
    add_column :reservations, :booking_id, :string
  end
end
