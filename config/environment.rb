# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Depot::Application.initialize!

# TO-DO: config for gmail later
Depot::Application.configure do
	config.action_mailer.delivery_method = :smtp
	
end

