class AddPermanentEventToActivities < ActiveRecord::Migration
  def change
  	add_column :activities, :permanent, :boolean
  end
end
