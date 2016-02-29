class AddResetSentToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :reset_sent_at, :datetime
  end
end
