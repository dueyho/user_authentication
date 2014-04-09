class Add < ActiveRecord::Migration
  def change
    remove_column :profiles, :avatar, :string
    remove_column :profiles, :picture, :string
  end
  def self.up
    add_attachment :profiles, :avatar
  end
  def self.down
    remove_attachment :users, :avatar
  end
end
