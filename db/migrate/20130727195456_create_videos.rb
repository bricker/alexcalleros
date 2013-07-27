class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :video_embed_url
      t.integer :category_id

      t.timestamps

      t.index :category_id
    end
  end
end
