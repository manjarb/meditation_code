class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :payment_made , :null => false
      t.float :payment_amount , :null => false

      t.references :activity, index: true
      t.references :user, index: true

      t.timestamps null: false
    end

    add_index :reservations, :id, unique: true
  end
end
