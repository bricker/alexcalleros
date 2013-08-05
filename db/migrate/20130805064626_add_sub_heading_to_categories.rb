class AddSubHeadingToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :sub_title, :string
  end
end
