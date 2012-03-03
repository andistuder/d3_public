Feature: User Authentication

  The authentication process should allow users to login and logout and should persist a user session

  Background:
    Given allow local http request

  Scenario: Clicking the Log In button
    #TODO needed to change below from given I am on the home page... as breaks if home not present.
    Given I am on the home page
    And I am not logged in
    When I go to the admin page
    Then I should be on the login page
    And I should see "Sign in"

  Scenario: Logging In from the Login Page
    Given I am the user "bingo@d3.com"
    When I Log In
    Then I should see "bingo@d3.com"
    And I should see "Admin"
    And I should see "Dashboard"
    And I should see "Log out"