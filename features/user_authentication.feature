Feature: User Authentication

  The authentication process should allow users to login and logout and should persist a UserSession

  Background:
    Given allow local http request

  Scenario: Clicking the Log In button
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


# MSP we have no session handle in Cukes.
# Maybe needs another pass

#  Scenario: The "I am logged in as" method
#    Given I am logged in as "bingo@d3.com"
#    Then there should be a session
#    And the user should be "bingo@d3.com"

#  Scenario: Logging Out
#    Given I am logged in as "bingo@d3.com"
#    When I logout
#    Then I go to the admin page
#    And I should see "Sign in"