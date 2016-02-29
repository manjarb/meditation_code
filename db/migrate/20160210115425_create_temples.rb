class CreateTemples < ActiveRecord::Migration
  def change
    create_table :temples do |t|
      t.string :name , :null => false
      t.string :logo_url
      t.string :slogan
      t.text :address , :null => false
      t.string :map_image_url
      t.string :phone_number , :null => false
      t.string :email , :null => false
      t.string :website
      t.float :latitude
      t.float :longitude
      t.string :temple_image01 , :null => false
      t.string :temple_image02 , :null => false
      t.string :temple_image03 , :null => false
      t.string :temple_image04
      t.string :temple_image05
      t.string :temple_image06 
      t.string :facebook_url
      t.string :country
      t.string :city

      t.references :admin_user, index: true

      t.timestamps null: false
    end

    add_index :temples, :id, unique: true
    add_index :temples, :name, unique: true
    add_index :temples, [:admin_user_id, :created_at]
  end
end
