Feature: News

  In order to update site visitors
  As an administrator
  I want to be able to post news items

  Background:
    Given allow local http request

  @javascript
  Scenario: Creating and viewing a News Item
    Given I am logged in as "admin@d3.com"
    And the following news items:
      | headline                 | content                                           |
      | Stop press, new D3 model | We could talk to you about it in great depth here |
      | New D3 feature           | You didn't eve know you needed it                 |
    And I added those news items to the CMS
    When I go to the news page
    Then I should see "Stop press, new D3 model"
    And I should see "We could talk to you about it in great depth here"
    And I should see "New D3 feature"
    And I should see "You didn't eve know you needed it"

  @javascript
  Scenario: Revealing more News Items
    Given the seeded news items
    When I go to the news page
    And I click link "SHOW 20 MORE"
    And I should see twenty more items
    And I click link "SHOW 20 MORE"
    And I should see all twenty five items
