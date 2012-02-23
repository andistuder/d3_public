Feature: Get d3
  In order to start using d3
  I want to be able to view how I can get d3

  Background:
    Given allow local http request

  @javascript
  Scenario: Creating and viewing features as an admin
    Given I am logged in as "admin@d3.com"
    And the following partner categories:
      | name              | slug                   | content                            |
      | Rental Partners   | rental-partners        | Rental Partners can rent d3 to you |
    And the following partners:
      | name            | slug        | summary                | town     | email          | website           |
      | Dummy User      | dummy-user  | About the Dummy User   | London   | dummy@user.com | http://user.com   |
    And the following partner content areas:
      |title           |content                      |
      |Skills          |dummy user skills            |
      |Addition Info   |additional information here  |
    And I add those partners to the CMS
    When I go to get d3 page
    Then I should see "Get d3"
    And I should see "Rental Partners"
    And I click link "Find Rental Partners"
    And I should see "Rental Partners"
    And I should see "Rental Partners can rent d3 to you"
    And I should see "Dummy User"
    Then I should see "London"
    Then I should see "About the Dummy User"
    Then I should see "dummy@user.com"
    Then I should see "http://user.com"
    When I click link "Dummy User"
    Then I should see "About the Dummy User"
    Then I should see "London"
    Then I should see "dummy@user.com"
    Then I should see "http://user.com"
    Then I should see "Skills"
    Then I should see "dummy user skills"
    Then I should see "Addition Info"
    Then I should see "additional information here"
