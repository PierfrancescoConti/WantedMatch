Feature: I want to create a match

Scenario: I'have a registred team
    Given i'm registraded user
    And I have a created team
    When I click create team match button
    Then I should create a team 
