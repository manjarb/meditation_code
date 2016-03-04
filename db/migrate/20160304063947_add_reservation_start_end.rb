class AddReservationStartEnd < ActiveRecord::Migration
  def change
    add_column :reservations, :activity_start_date, :date
    add_column :reservations, :activity_end_date, :date


    add_index :reservations, :activity_start_date
  end
end
