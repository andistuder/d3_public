# config/initializers/mailer.rb
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'd3technologies.com',
  :user_name            => 'YOUR_FROM_ADDRESS',
  :password             => 'YOUR_PASSWORD',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }


#ActionMailer.setup do |config|
#
#  config.default_url_options = { :host => "d3technologies.com" }
#end

