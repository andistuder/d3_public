Feature: Download
  In order to update my d3 system
  I want to be able to view d3 downloads


  Background:
    Given allow local http request

  @javascript
  Scenario: Creating and viewing a Download item as an admin
    Given I am logged in as "admin@d3.com"
    And the following download categories:
      | name    |
      | Video   |
      | Popular |
    And the following download items:
      | name            | content            |
      | Software update | Software v1        |
      | Plugin update   | Super Plugin       |
    And I added those download items to the CMS
    When I go to the downloads page
    Then I should see "Downloads"
    Then I should see "Video"
    Then I should see "Popular"
    And I should see "Software update"
    And I should see "Software v1"
    And I should see "Plugin update"
    And I should see "Super Plugin"

  @javascript
  Scenario: Revealing more Download items
    Given the seeded 25 download items
    When I go to the downloads page
    And I click link "SHOW 20 MORE"
    And I should see twenty more download items
    And I click link "SHOW 20 MORE"
    And I should see all twenty five download items
    And I click link "SHOW 20 MORE"
    And I should see "NO MORE ITEMS"

