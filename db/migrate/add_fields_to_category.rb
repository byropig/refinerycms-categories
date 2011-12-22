class AddFieldsToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :lft, :integer
    add_column :categories, :rgt, :integer
    add_column :categories, :depth, :integer
  end

  def self.down
    remove_column :categories, :depth
    remove_column :categories, :rgt
    remove_column :categories, :lft
  end
end
