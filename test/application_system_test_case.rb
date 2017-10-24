# test/application_system_test_case.rb
require "test_helper"
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :headless_chrome, screen_size: [1280, 720]
end
