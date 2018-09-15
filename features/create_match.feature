Feature: I want to create a match

Scenario: Creation Match
    Given I am a registered user
    And I have a created team
    When I click create team match button
    And I fill all fields
    Then I should create a team
