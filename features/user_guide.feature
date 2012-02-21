Feature: User Guide

  In order to enable users to learn about D3
  I want to be able view a user guide

  Background:
    Given allow local http request

  @javascript
  @wip
  Scenario: Creating and viewing a chapter as an admin
    Given I am logged in as "admin@d3.com"
    And the following chapters:
      | name            | sort order | summary                        | content                                 | parent_id
      | Add Video       | 1          | Summary about how to add video | lots of detail about adding video to D3 | 0
      | Line up markers | 1          | Summary about line up markers  | more detail about line up markers       | 1
      | Add video child | 1          | Summary about add video child  | more detail about add video child       | 1
    And I added those chapters to the CMS
    When I go to the user guide page
    Then I should see those chapters
#    Then I should see "Stop press, new D3 model"
#    And I should see "We could talk to you about it in great depth here"
#    And I should see "New D3 feature"
#    And I should see "You didn't eve know you needed it"
