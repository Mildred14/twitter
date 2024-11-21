require 'test_helper'

ENV['RAILS_SYSTEM_TESTING_SCREENSHOT_HTML'] = '1'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome
end