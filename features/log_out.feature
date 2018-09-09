Feature: I want to log out
Scenario: Log out
    Given I am in some page
    When I click on Logout
    Then I should see 'logged out'
