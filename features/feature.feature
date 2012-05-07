Feature: Feature

  In order to describe the d3 software
  I want to be able to view feature items

  Background:
    Given allow local http request

  @javascript
  Scenario: Creating and viewing features as an admin
    Given I am logged in as "admin@d3.com"
#    TODO fix this test..
#    And the following feature categories:
#      | name  | slug  | content                         |
#      | Stage | stage | With d3 you can visualise in 3d |
#    And the following features:
#      | name            | slug            | content                                                                                                                                                                                                                       |
#      | Visualise in 3d | visualise-in-3d | Sed placerat arcu et magna accumsan porta. Sed vehicula purus in turpis mattis lacinia. Donec nisi nibh, tempor non eleifend                                                                                                  |
#      | Live Input      | live-input      | Nec ante imperdiet rhoncus. Sed sed erat eros. Proin hendrerit ante ac enim placerat ut vestibulum mauris blandit. Etiam ullamcorper |
#    And I add those features to the CMS
#    When I go to the features page
#    Then I should see "Stage"
#    And I should see "With d3 you can visualise in 3d"
#    And I click link "More"
#    And I should see "Visualise in 3d"
#    And I should see "Sed placerat arcu et magna accumsan porta. Sed vehicula purus in turpis mattis lacinia. Donec nisi nibh, tempor non eleifend"
#    And I should see "Live Input"
#    And I should see "Nec ante imperdiet rhoncus. Sed sed erat eros. Proin hendrerit ante ac enim placerat ut vestibulum mauris blandit. Etiam ullamcorper"

