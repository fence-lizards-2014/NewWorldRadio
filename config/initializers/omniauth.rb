require 'omniauth-spotify'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :beats, 'yupuktqwpjsbdka36drye9fv', 'T3PTVA6Aj83cVHNAuZg6V9HN'
end