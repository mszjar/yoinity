# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Trusted hosts
Rails.application.config.hosts << 'https://www.yoinity.com'
Rails.application.config.hosts << 'www.yoinity.com'
Rails.application.config.hosts << 'yoinity.com'

# Redirection
Rails.application.routes.default_url_options[:host] = 'https://www.yoinity.com'
