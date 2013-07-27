class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :key
      t.text :text

      t.timestamps

      t.index :key
    end
  end
end
