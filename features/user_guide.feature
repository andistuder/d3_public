Feature: User Guide

  In order to enable users to learn about D3
  I want to be able view a user guide

  Background:
    Given allow local http request

  @javascript
  Scenario: Creating and viewing a chapter as an admin
    Given I am logged in as "admin@d3.com"
    And the following content_areas
      | name             | content                        |
      | user_guide_intro | User guide page intro copy describing the user guide |
      | user_guide_body  | h1. Before you start reading the user guide \n read this section thoroughly |
    And the following parent chapters
      | name      | sort_order | summary                        | content                                 | parent_id |
      | Add Video | 1          | Summary about how to add video | lots of detail about adding video to D3 | nil       |
    And the following child chapters
      | name            | sort_order | summary                       | content                           | parent_id |
      | Line up markers | 1          | Summary about line up markers | more detail about line up markers | 1         |
      | Add video child | 2          | Summary about add video child | more detail about add video child | 1         |
    And I added those chapters to the CMS
    And I added those content areas to the CMS
    When I go to the user guide page
    Then I should see those chapters
