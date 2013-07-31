class RenameVideoEmbedUrlToEmbedUrl < ActiveRecord::Migration
  def change
    rename_column :videos, :video_embed_url, :embed_url
  end
end
