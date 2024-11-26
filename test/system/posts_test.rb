require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  test "visiting posts" do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')

    login_as(user)
    visit posts_path

    assert_selector(:xpath, './/input[contains(@value,"Postear")]')
  end

  test "create one post" do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')

    login_as(user)
    visit posts_path

    find(:css, "input[id$='post-content']").set("My first Post")
    click_on "Postear"

    assert_selector "p", text: "My first Post"
  end
end
