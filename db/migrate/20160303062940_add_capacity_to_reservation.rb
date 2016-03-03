class AddCapacityToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :quantity, :integer , default: 0
  end
end
