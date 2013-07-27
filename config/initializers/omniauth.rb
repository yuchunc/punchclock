OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Figaro.env.app_id, Figaro.env.app_secret
end
