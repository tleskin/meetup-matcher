Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['client_id'], ENV['client_secret']
end