Rails.application.config.middleware.use OmniAuth::Builder do
  provider :rdio, '2x7twe9uub86qteubzvq9sgd', 'WwYRs493r9'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :rdio_oauth2, ENV["2x7twe9uub86qteubzvq9sgd"], ENV["WwYRs493r9"]
end