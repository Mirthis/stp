Feature: Create iem
  In order to share my object with others
  A User
  Should be able to create a new item

  Scenario: Create item
    Given I am logged in
    When I create an item
    Then I should see the created item