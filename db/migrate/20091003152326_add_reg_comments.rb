class AddRegComments < ActiveRecord::Migration
  def self.up
    add_column :registrations, :comments, :string
  end

  def self.down
    remove_column :registrations, :comments
  end
end
