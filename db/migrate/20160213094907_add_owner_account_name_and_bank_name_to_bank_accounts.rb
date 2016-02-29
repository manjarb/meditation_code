class AddOwnerAccountNameAndBankNameToBankAccounts < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :owner_account_name, :boolean
    add_column :bank_accounts, :bank_name, :boolean

  end
end
