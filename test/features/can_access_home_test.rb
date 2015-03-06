require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  def test_homepage_has_content
  	visit root_path
  	assert page.has_content?("Welcome to Vinna!")
  end
end
