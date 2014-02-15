require "spec_helper"
feature "Accounts" do
  scenario "creating an account" do
    visit subscribe.root_path
    click_link "Account Sign Up"
    fill_in "Name", :with => "Test"
    fill_in "Subdomain", :with => "test"
    fill_in "Email", :with => "subscribe@veryona.com"
    fill_in "Password", :with => 'password', :exact => true
    fill_in "Password confirmation", :with => "password"
    click_button "Create Account"
    page.current_url.should == "http://test.example.com/subscribe/"
  end
end

