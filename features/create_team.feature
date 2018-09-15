Feature: I want to create a team

Scenario: i'm a logged user
    Given i'm registraded
    When I click create team botton
    Then I should see the create team page
