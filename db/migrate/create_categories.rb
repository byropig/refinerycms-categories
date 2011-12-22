class CreateCategories < ActiveRecord::Migration

  def self.up
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id
      t.integer :position

      t.timestamps
    end

    add_index :categories, :id

    load(Rails.root.join('db', 'seeds', 'categories.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "categories"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/categories"})
    end

    drop_table :categories
  end

end
