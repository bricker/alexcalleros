class AddPositionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :position, :integer
    add_index :videos, :position
    add_index :videos, :created_at
  end
end
