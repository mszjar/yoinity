# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Redirection
Rails.application.routes.default_url_options[:host] = 'www.yoinity.com'
Rails.application.routes.default_url_options[:protocol] = 'https'
