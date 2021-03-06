Feature: User Guide

  In order for users to learn about D3
  We want to provide a user guide

  Background:
    Given allow local http request
    Given I am logged in as "admin@d3.com"
    And the following content_areas
      | name             | content                        |
      | user_guide_intro | User guide page intro copy describing the user guide |
      | user_guide_body  | h1. Before you start reading the user guide \n read this section thoroughly |
    And the following parent chapters
      | name      | sort_order | content                                 | parent_id |
      | Add Video | 1          | lots of detail about adding video to D3 | nil       |
    And the following child chapters
      | name            | sort_order | content                           | parent_id |
      | Line up markers | 1          | more detail about line up markers | 1         |
      | Add video child | 2          | more detail about add video child | 1         |
    And I added those chapters to the CMS
    And I added those content areas to the CMS

  @javascript
  Scenario: Viewing chapter navigation
    When I go to the user guide page
    Then I should see those chapters

#  @javascript
#  Scenario: Viewing chapter summary
#    When I go to the user guide page
#    And I click span "add-video"
#    Then I should see a summary of it's chapters

  @javascript
  Scenario: Viewing full chapter
    When I go to the user guide page
    And I click link "add-video"
#    And I wait for "Line up markers" to appear
#    And I click link "Line up markers"
    Then I should see a the chapter detail



