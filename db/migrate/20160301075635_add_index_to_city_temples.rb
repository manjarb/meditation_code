class AddIndexToCityTemples < ActiveRecord::Migration
  def change
    add_index :temples, :city
  end
end
