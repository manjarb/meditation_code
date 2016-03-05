class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|

      t.string  :activity_name

      t.references :activity , index: true
      t.references :user , index: true

      t.timestamps null: false
    end

    add_index :wishlists, [:activity_id, :user_id]
  end
end
