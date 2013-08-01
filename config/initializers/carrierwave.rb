CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => AWS_ACCESS_KEY_ID,
    :aws_secret_access_key  => AWS_SECRET_ACCESS_KEY,
    :region                 => 'us-west-1',
    :endpoint               => 'https://s3.amazonaws.com'
  }

  config.fog_directory  = 'alexcalleros'
  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control'=>'max-age=315576000' }

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
