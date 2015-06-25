# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings ={
  address: "smtp.gmail.com",
  port: 587,
  domain: "localhost:3000",
  authentication: :plain,
  enable_starttls_auto: true,
  user_name: "duongnv.hedspi@gmail.com",
  password: "mr.cay30492"
}
