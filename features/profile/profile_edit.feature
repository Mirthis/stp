Feature: Edit Profile
  In order to provide up to date information
  A User
  Should be able to update his profile

  Scenario: Update Profile Information
    Given I am logged in
    When I update my profile information
    Then I should see the updated profile information

  Scenario: Update Profile Picture
    Given I am logged in
    When I update my profile picture
    Then I should see the updated profile picture

  Scenario: Update Profile Failed
    Given I am logged in
    When I update my profile with invalid data
    Then I should see the unable to update profile message

      