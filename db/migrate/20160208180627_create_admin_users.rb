class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :username ,unique: true
      t.string :name ,unique: true
      t.string :email ,unique: true
      t.string :password_digest
      t.string :remember_digest
      t.float :balance ,default: 0
      t.boolean :admin ,default: false

      t.timestamps null: false
    end

  end
end
