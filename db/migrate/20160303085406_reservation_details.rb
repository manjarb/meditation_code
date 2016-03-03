class ReservationDetails < ActiveRecord::Migration
  def change
    add_column :reservations, :firstname, :string , :null => false
    add_column :reservations, :lastname, :string , :null => false
    add_column :reservations, :email, :string , :null => false
    add_column :reservations, :phone_number, :string

    add_index :reservations, :email, unique: true
  end
end
