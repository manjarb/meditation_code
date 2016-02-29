class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username ,unique: true
      t.string :name ,unique: true
      t.string :email ,unique: true
      t.string :password_digest
      t.string :remember_digest
      t.float :balance ,default: 0
      t.boolean :admin ,default: false
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
