Feature: Setup backups

  As an administrative user,
  I want to be set up automated backups,
  so that information can be retrieved in the event of failure.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative user sets up automated backups successfully
    Given the admin is on the platform settings page
    When the admin selects the backup frequency <frequency>, the storage destination <storage>
    Then the platform will backup every interval and store it in <storage> in the event of failure
    Examples:
      | frequency | storage        |
      | Daily     | Cloud_Server_1 |
      | Weekly    | HardDrive_1    |

      # Alternate Flow
  Scenario Outline: The administrative user sets up automated backups for a subset of channels successfully
    Given the admin is on the platform settings page
    When the admin selects the backup frequency <frequency>, the storage destination <storage>, and the channels desired <channels>
    Then the platform will backup the desired channels at every interval and store it in <storage> in the event of failure
    Examples:
      | frequency | storage        | channels                                |
      | Daily     | Cloud_Server_1 | Assignments, Announcements, Submissions |
      | Weekly    | HardDrive_1    | Course Material                         |

        # Error Flow
  Scenario Outline: The administrative user tries to set backups for a channel that does not exist
    Given the admin is on the platform settings page
    When the admin selects the backup frequency <frequency>, the storage destination <storage>, and the channels desired <channels>
    And at least one channel in the provided channels does not exist
    Then the platform will exit from the configuration
    And the error <error> will be displayed to the admin
    Examples:
      | frequency | storage        | channels                             | error                                                |
      | Daily     | Cloud_Server_1 | ignments, Announcements, Submissions | Invalid channel provided. Could not configure backup |