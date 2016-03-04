class FixIndexReservation < ActiveRecord::Migration
  def change
    remove_index :reservations, :email
    add_index :reservations, :email
  end
end
