require 'digest/sha1'

if Rails.env.production?
  config = ENV
else
  # Admin Username and Password in local env is "dev"
  config = YAML.load_file(Rails.root.join('config', 'secrets.yml'))
end

ADMIN_USERNAME          = config['ADMIN_USERNAME']
ADMIN_PASSWORD          = config['ADMIN_PASSWORD']
AWS_ACCESS_KEY_ID       = config['AWS_ACCESS_KEY']
AWS_SECRET_ACCESS_KEY   = config['AWS_SECRET_ACCESS_KEY']
