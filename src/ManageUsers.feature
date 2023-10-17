Feature: Manage user generated content

  As an administrative user,
  I want to be able to remove and ban distributive users,
  so that the platform remains the collaboration space remains respectful.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative user receives complaint about a user in a group
    Given the admin is on the group page
    And the admin finds disrespectful messages from the user
    When the admin clicks on the user's profile
    And selects Remove User
    Then the user is removed from the workspaace and a message <message> will be displayed next time the user logs in
    Examples:
      | message                                                                   |
      | You have been removed from the workspace for breaching academic integrity |

     # Alternate Flow: example of student that changes groups
  Scenario Outline: The administrative user finds a disruptive user in a channel and bans them
    Given the admin found a disruptive user in a channel
    When the admin clicks on the user
    And selects the Ban option on their profile
    Then the user will now lose access to the platform
    And the user is unable to log into the platform in the future and sees the message <message>
    Examples:
      | message                                              |
      | You have been banned indefinitely from this platform |
