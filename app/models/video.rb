class Video < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :title, :embed_url
  mount_uploader :thumbnail, ThumbnailUploader
end
