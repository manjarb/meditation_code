class Fix < ActiveRecord::Migration
  def change
    change_column :bank_accounts, :owner_account_name, :string
    change_column :bank_accounts, :bank_name, :string
  end
end
