require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the sign in" do
    visit new_user_session_path

    assert_selector "h2", text: "Log in"
  end

  test "signing in with invalid information" do
    visit new_user_session_path
    fill_in "Email", with: ""

    click_on "Log in"
    assert_selector "p", text: "Invalid Email or password."
  end

  test "signing in with valid information" do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
    visit new_user_session_path
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "f4k3p455w0rd"

    click_button "Log in"
    assert_selector(:xpath, './/input[contains(@placeholder,"¡¿Qué esta pasando?!")]')
  end
end
