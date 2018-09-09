Feature: I want to log in
Scenario: Log in
    Given I am registered
    And I am on the Log in page
    And I have filled Usname and Pwd
    When I click on Sign in
    Then I should see my profile page
