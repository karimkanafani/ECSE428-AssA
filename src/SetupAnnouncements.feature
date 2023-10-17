Feature: Create announcements and notifications

  As an administrative user,
  I want to be able to create announcements and notifications for all students,
  so that important information can be shared easily.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative user creates an announcement
    Given the admin selects the channel in which the announcement should be broadcast
    When the admin sends the announcement <message>
    Then the users with access to the channel will be notified <notification> of the new announcement
    And the message will be highlighted in the chat
    Examples:
      | message                      | notification                                                   |
      | No office hours this week... | The admin has made an announcement in the Office Hours channel |
      | Class will be held online... | The admin has made an announcement in the Announcement channel |

     # Alternate Flow: notification example
  Scenario Outline: The administrative user sends a notification to users
    Given the admin is on the notification creation screen
    When the admin provides the message <message> to the notification
    And sends it to the desired users with roles <role>
    Then the users with the <role> will be privately notified with the <message> provided
    Examples:
      | message                                | role           |
      | Assignment grades are out              | Student        |
      | Project deadline is tomorrow           | Student        |
      | Schedule disrupted due to reading week | Student, Staff |

        # Error Flow
  Scenario Outline: The administrative user sends an invalid notification
    Given the admin is on the notification creation screen
    When the admin provides the message <message> to the notification
    And sends it to the desired users with roles <role>
    Then the notification will not be created
    And an error <error> will be returned to the admin
    Examples:
      | message                                     | role    | error                                           |
      | ""                                          | TA      | Message cannot be empty                         |
      | Grades out                                  | Stydent | Role does not exist                             |
      | Don't forget to pass by Office Hours to ... | Student | Message exceeds the maximum notification length |
