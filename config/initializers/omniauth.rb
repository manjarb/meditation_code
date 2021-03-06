OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'] , ENV['FACEBOOK_SECRET'], :scope => 'email', :display => 'popup', :info_fields => 'name,email'
end