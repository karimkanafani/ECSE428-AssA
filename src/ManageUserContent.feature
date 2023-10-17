Feature: Manage user generated content

  As an administrative user,
  I want to be able to review and moderate user generated content,
  so that the platform remains appropriate and safe.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative finds inappropriate content in a channel
    Given the admin found inappropriate content in a channel
    When the admin clicks on it
    And selects deleted content
    Then the content will be removed and a message <message> will be displayed in its place
    Examples:
      | message                                                         |
      | This file has been removed by the admin for breaching policy    |
      | This message has been removed by the admin for breaching policy |

     # Alternate Flow: example of student that changes groups
  Scenario Outline: The administrative user finds inappropriate content in a channel and silences the user responsible
    Given the admin found inappropriate content in a channel
    And found the user responsible for the content
    When the admin clicks on the user
    And selects the Silence option on their profile
    Then the user will now lose the ability to interact in chats
    And all the content the user has sent in the channel will be removed and replaced by the message <message>
    Examples:
      | message                                                   |
      | This file has been removed since the user was silenced    |
      | This message has been removed since the user was silenced |
