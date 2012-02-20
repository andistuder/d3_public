Feature: Project
   pending "todo once view finalised"

  In order to learn about the d3 software
  I want to be able to view project made with d3

  Background:
    Given allow local http request

  @javascript
  Scenario: Creating and viewing features as an admin
    Given I am logged in as "admin@d3.com"
    And the following project categories:
      | name        | slug         | content                         | summary             |
      | TV Projects | tv-projects  | With d3 you can do TV projects  | TV Projects Summary |
    And the following projects:
      | name            | slug            | summary                                          | concept           | how_made            |
      | Take That Tour  | take-that-tour  | Sed placerat arcu et magna accumsan porta.       | TakeThat Concept  | Made with Take That |
      | Jay-Z           | jay-z           | Nec ante imperdiet rhoncus. Sed sed erat eros.   | Jay-Z Concept     | Made with Jay-Z     |
    And I add those projects to the CMS
    When I go to the projects page
    Then I should see "Projects"
    And I should see "TV Projects Summary"
    And I click link "More"
    And I should see "TV Projects"
    And I should see "With d3 you can do TV projects"
    And I should see "Take That Tour"
    And I should see "Jay-Z"
    When I click link "Jay-Z"
    Then I should see "Nec ante imperdiet rhoncus. Sed sed erat eros."
    Then I should see "Jay-Z"
    Then I should see "Jay-Z Concept"
    Then I should see "Made with Jay-Z"


