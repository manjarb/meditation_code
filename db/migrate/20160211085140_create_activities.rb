class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name , :null => false
      t.text :details , :null => false
      t.date :start_at
      t.date :end_at
      t.string :activity_image01_url , :null => false
      t.string :activity_image02_url , :null => false
      t.string :activity_image03_url , :null => false
      t.string :youtube_url , :null => false
      t.integer :capacity
      t.boolean :booking_status , :default => false
      t.text :rules
      t.text :apply_details
      t.integer :payment_price
      t.boolean :payment_need , :default => false
      t.boolean :avaliable , :default => true
      t.float :rating

      t.references :admin_user, index: true
      t.references :temple, index: true

      t.timestamps null: false
    end

    add_index :activities, :id, unique: true
    add_index :activities, :name, unique: true
    add_index :activities, [:admin_user_id, :created_at]
    add_index :activities, [:temple_id, :created_at]
  end
end
