class AddIndexReservationDate < ActiveRecord::Migration
  def change
    add_index :reservations, :payment_made
  end
end
