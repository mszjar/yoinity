# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Trusted hosts
Rails.application.config.hosts << 'www.yoinity.com'

# Redirection
Rails.application.routes.default_url_options[:host] = 'www.yoinity.com'
