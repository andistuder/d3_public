Feature: FAQ

  In order for users to learn about D3
  We want to provide an FAQ

  Background:
    Given allow local http request
    Given I am logged in as "admin@d3.com"
    And the following faq categories
      | name         |
      | Most popular |
      | Software     |
      | Hardware     |
    And the following faqs
      | question                      | answer                                   |
      | What is the meaning of life   | forty two                                |
      | How do I upgrade or downgrade | You should probably read this thoroughly |
    And I added those faqs to the CMS

  @javascript
  Scenario: Viewing faqs
    When I go to the faq page
    Then I should see those faqs
    And I click link "Software"
    Then I should see faqs for that category



