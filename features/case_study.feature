Feature: CaseStudy
  In order to learn about how d3 is used
  I want to be able to view d3 case studies

  Background:
    Given allow local http request

  @javascript
  Scenario: Creating and viewing features as an admin
    Given I am logged in as "admin@d3.com"
    And the following case studies:
      | name       | slug          | case_study_category_name |summary                                          | introduction                        | content                      | sidebar            |
      | Take That  | take-that-cs  | Concerts                 |Sed placerat arcu et magna accumsan porta.       | Intro et magna accumsan porta.      | Content TakeThat How Made    | side bar content 1 |
      | Lion King  | lion-king-cs  | Theatre                  |Nec ante imperdiet rhoncus. Sed sed erat eros.   | Intro rhoncus. Sed sed erat eros.   | Lion King how made           | side bar content 2 |
    And I add those case studies to the CMS
    When I go to the case studies page
    Then I should see "Case Studies"
    And I should see "Concerts"
    And I should see "Take That"
    And I should see "Sed placerat arcu et magna accumsan porta."
    And I should see "Theatre"
    And I should see "Lion King"
    And I should see "Nec ante imperdiet rhoncus. Sed sed erat eros. "
    And I click link "Take That"
    And I should see "Take That, Case Study"
    And I should see "Intro et magna accumsan porta."
    And I should see "Content TakeThat How Made"
    And I should see "side bar content 1"



