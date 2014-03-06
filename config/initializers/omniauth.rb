OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '241654275999158', '42eadee11413ad98a2992e08976f7cd5'
end