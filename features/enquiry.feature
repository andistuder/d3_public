Feature: Enquiry

  In order to contact the d3
  I want to be able to fill in and submit the contact form

  Background:
    Given allow local http request

  @javascript
  Scenario: Completing and submitting the contact form
    Given I am logged in as "admin@d3.com"
    And the following enquiry page content:
      | name    | slug    | content     |
      | Enquiry form | enquiry | Lorem ipsum |
    And I add this page to the CMS
    When I go to the enquiry page
    Then I should see "Enquiry form"
    Given the following form data:
      | first_name | last_name | company        | email                  | city    | phone1        |
      | Robert 3D  |  Del Naja | Massive Attack | info@massiveattack.com | Bristol | 020 0000 0000 |
    And I add those features to the enquiry form
    Then I should see "Thank you for you interest in d3. One of our team members will get back to shortly."

