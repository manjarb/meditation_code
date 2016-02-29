class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :name , :null => false
      t.string :number , :null => false

      t.references :admin_user, index: true

      t.timestamps null: false
    end

    add_index :bank_accounts, :id, unique: true
  end
end
