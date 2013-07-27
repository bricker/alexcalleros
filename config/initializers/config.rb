require 'digest/sha1'

if Rails.env.production?
  ADMIN_USERNAME = ENV['ADMIN_USERNAME']
  ADMIN_PASSWORD = ENV['ADMIN_PASSWORD']
else
  ADMIN_USERNAME = Digest::SHA1.hexdigest("dev")
  ADMIN_PASSWORD = Digest::SHA1.hexdigest("dev")
end
