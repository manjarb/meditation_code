class ChangeUserIdColumnType < ActiveRecord::Migration
  def change
    change_column :users, :id, :bigint
  end
end
