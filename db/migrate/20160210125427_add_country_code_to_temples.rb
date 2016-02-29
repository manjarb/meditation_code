class AddCountryCodeToTemples < ActiveRecord::Migration
  def change
    add_column :temples, :country_code, :string
  end
end
