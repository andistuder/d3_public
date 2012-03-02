Feature: Workflow
  In order to learn about the d3 software
  I want to be able to view the workflow page

  Background:
    Given allow local http request

  @javascript
  Scenario: Creating and viewing features as an admin
    Given I am logged in as "admin@d3.com"
    And the following workflow items:
      | title     | list_title      | content_area                                     | list_area         | overlay                                        |
      | title one | list title one  | Sed placerat arcu et magna accumsan porta.       | * list item one   | Overlay placerat arcu et magna accumsan porta. |
      | title two | list title two  | Nec ante imperdiet rhoncus. Sed sed erat eros.   | * list item two   | Overlay imperdiet rhoncus. Sed sed erat eros.  |
    And I add those workflow items to the CMS
    When I go to the workflow page
    Then I should see "Workflow"
    And I should see "title one"
    And I should see "title two "
    And I should see "list title one"
    And I should see "list title two"
    And I should see "Sed placerat arcu et magna accumsan porta."
    And I should see "Nec ante imperdiet rhoncus. Sed sed erat eros."
    And I should see "list item one"
    And I should see "list item two"



