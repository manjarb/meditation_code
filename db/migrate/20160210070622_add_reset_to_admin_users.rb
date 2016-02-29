class AddResetToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :reset_digest, :string
  end
end
