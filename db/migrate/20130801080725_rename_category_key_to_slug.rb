class RenameCategoryKeyToSlug < ActiveRecord::Migration
  def change
    remove_index :categories, :key
    rename_column :categories, :key, :slug
    add_index :categories, :slug
  end
end
