Feature: I want to sign up
Scenario: Sign up
    Given I am on the New User page
    And I have filled all fields
    When I click on Continue
    Then I should be able to Log in with my new account
