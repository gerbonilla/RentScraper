# test/test_helper.rb
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
  include Warden::Test::Helpers
  Warden.test_mode!
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => { args: %w(headless disable-gpu) })
  Capybara::Selenium::Driver.new app, browser: :chrome, desired_capabilities: capabilities
end
Capybara.save_path = Rails.root.join('tmp/capybara')
Capybara.javascript_driver = :headless_chrome
