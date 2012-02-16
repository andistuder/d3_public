Feature: Feature

  In order to describe the d3 software
  As an administrator
  I want to be able to feature items

  Background:
    Given allow local http request

  Scenario: Clicking the Log In button
    Given I am logged in as "admin@d3.com"
    When I go to the admin page
    And I click link "Feature categories"
    And I click link "Add new"
    And I fill in "feature_category_name" with "Stage"
    And I fill in "feature_category_slug" with "stage"
    And I fill in "feature_category_content" with "With d3 you can visualise in 3d"
    And I press "Save"
    When I go to the features page
    Then I should see "Stage"
    And I should see "With d3 you can visualise in 3d"