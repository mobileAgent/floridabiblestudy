class DropGenderShirt < ActiveRecord::Migration
  def self.up
    remove_column :registrations, :shirt
    remove_column :registrations, :gender
  end

  def self.down
  end
end
