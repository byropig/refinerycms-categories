class TableCreateBannersCategories < ActiveRecord::Migration
  def self.up
    create_table :banners_categories, :id => false do |t|
      t.integer :category_id
      t.integer :banner_id
      t.timestamps
    end

    add_index :banners_categories, :category_id
    add_index :banners_categories, :banner_id
  end

  def self.down
    drop_table :banners_categories
  end
end
