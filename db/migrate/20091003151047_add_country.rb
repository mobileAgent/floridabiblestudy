class AddCountry < ActiveRecord::Migration
  def self.up
    add_column :registrations, :country, :string
  end

  def self.down
    remove_column :registrations, :country
  end
end
