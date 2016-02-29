class AddProfileImageToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :profile_image, :string
  end
end
