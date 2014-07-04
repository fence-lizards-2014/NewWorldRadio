require 'omniauth-spotify'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, 'bb63bb208eb74afb9c9463e70519da84', 'aab6d4dcc54a4e3db703b57eec67cdc7', scope: 'streaming'
end

# , scope: 'streaming',state: ''