CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     '***',       # required
    aws_secret_access_key: '***',                        # required
  }
  config.fog_directory  = 'bien-reviews-superhi'                                   # required

end
