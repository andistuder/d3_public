Feature: News

  In order to update site visitors
  As an administrator
  I want to be able to post news items

  Background:
    Given allow local http request

  Scenario: Clicking the Log In button
    Given I am logged in as "admin@d3.com"
    When I go to the admin page
    And I click link "News items"
    And I click link "Add new"
    And I fill in "news_item_headline" with "Stop press, new D3 model"
    And I fill in "news_item_summary" with "Well, you wouldn't believe it the new version is even better.."
    And I fill in "news_item_content" with "Well, you wouldn't believe it the new version is even better and on and on"
    And I press "Save"
    When I go to the news page
    Then I should see "Stop press, new D3 model"
    And I should see "Well, you wouldn't believe it the new version is even better and on and on"
