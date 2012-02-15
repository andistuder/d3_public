# Authlogic ~ Cucumber Authentication Steps

# Activate AuthLogic prior to testing

Before do
  #require "authlogic/test_case"
	#include Authlogic::TestCase
	#activate_authlogic
end

#
# Helper Methods available to other steps
#

def create_user(login)
  @current_user = FactoryGirl.create(:user, :email => login)
end

def login_user_current_screen
  login_user("")
end

def login_user(url = "/admin")
  visit url if url != ""
  within("#new_user") do
    fill_in("user_email", :with => @current_user.email)
    fill_in("user_password", :with => "passw0rd")
    click_button("Sign in")
  end
end

def logout_user
  create_user "log_me@out.com"
  login_user("/admin")
  click_link("Log out") #hard else to ensure we're not logged in
end

def user_session
  @session ||= session[:user]
end

Given /^allow local http request$/ do
  WebMock.disable_net_connect!(:allow => "127.0.0.1:62479")
end

#
# Cucumber Assertions
#

Given /^I am the user "(.*)"$/ do |login|
  create_user login
end

Given /^I am logged in as "(.*)"$/ do |login|
  create_user login
	login_user
end

Given /^I am not logged in$/ do
  logout_user
end

When /^I Log In$/ do
  login_user
end

When /^I Log In on current screen$/ do
  login_user_current_screen
end

When /^I logout$/ do
  logout_user
end

Then /^there should be a session$/ do
  user_session
  @session.should_not be nil
end

Then /^there should not be a session$/ do
  user_session
  @session.should be nil
end

Then /^the user should be "([^"]*)"$/ do |login| #"
  user_session
  @session.email.should be == login
end
Given /^we allow local http request$/ do
  pending
end