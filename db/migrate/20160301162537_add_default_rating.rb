class AddDefaultRating < ActiveRecord::Migration
  def change
    change_column :activities, :rating, :float, :default => 0
  end
end
