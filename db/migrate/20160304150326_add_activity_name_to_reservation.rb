class AddActivityNameToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :activity_name, :string
  end
end
