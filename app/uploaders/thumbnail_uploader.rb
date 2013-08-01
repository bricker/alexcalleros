class ThumbnailUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "thumbnails/#{model.id}"
  end
end
