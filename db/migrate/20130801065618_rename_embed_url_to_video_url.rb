class RenameEmbedUrlToVideoUrl < ActiveRecord::Migration
  def change
    rename_column :videos, :embed_url, :url
  end
end
