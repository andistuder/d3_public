Feature: News

  In order to get new information
  I want to be able views news items

  Background:
    Given allow local http request

  @javascript
  Scenario: Creating and viewing a News Item as an admin
    Given I am logged in as "admin@d3.com"
    And the seeded the category General
    And the following news items:
      | headline                 | content                                           |
      | Stop press, new D3 model | We could talk to you about it in great depth here |
      | New D3 feature           | You didn’t eve know you needed it                 |
    And I added those news items to the CMS
    When I go to the news page
    Then I should see "Stop press, new D3 model"
    And I should see "We could talk to you about it in great depth here"
    And I should see "New D3 feature"
    And I should see "You didn’t eve know you needed it"

  @javascript
  Scenario: Revealing more News Items
    Given the seeded 25 news items
    When I go to the news page
    And I click link "SHOW 10 MORE"
    And I should see ten more items
    And I click link "SHOW 10 MORE"
    And I should see all twenty five items
    And I click link "SHOW 10 MORE"
    And I should see "NO MORE ITEMS"

  @javascript
  Scenario: Creating and viewing announcements as an admin
    Given I am logged in as "admin@d3.com"
    And the seeded the category Product updates
    And the following news items:
      | headline                 | content                                           |
      | Stop press, new D3 model | We could talk to you about it in great depth here |
      | New D3 feature           | You didn’t eve know you needed it                 |
    And I added those news items to the CMS
    When I go to the announcements page
    Then I should see "Stop press, new D3 model"
    And I should see "We could talk to you about it in great depth here"
    And I should see "New D3 feature"
    And I should see "You didn’t eve know you needed it"

  @javascript
  Scenario: Revealing more announcements
    Given the seeded 25 announcement items
    When I go to the announcements page
    And I click link "SHOW 10 MORE"
    And I should see ten more items
    And I click link "SHOW 10 MORE"
    And I should see all twenty five items
    And I click link "SHOW 10 MORE"
    And I should see "NO MORE ITEMS"

