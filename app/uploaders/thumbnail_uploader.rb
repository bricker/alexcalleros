class ThumbnailUploader < CarrierWave::Uploader::Base
  def store_dir
    "thumbnails/#{model.id}"
  end
end
