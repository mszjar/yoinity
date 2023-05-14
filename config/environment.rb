# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# redirection
Rails.application.routes.default_url_options[:host] = 'https://www.yoinity.com'
