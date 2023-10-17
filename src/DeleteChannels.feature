Feature: Delete channels

  As an administrative user,
  I want to be able to delete unwanted channels,
  so that I can better manage the platform.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative user deletes a channel successfully
    Given the admin is in the channel they want to delete
    When the admin clicks on the delete button
    And selects to backup the channel <name> data into a zip <file>
    Then the backup process is started
    And once the backup is done, the channel is deleted
    And the backup is downloaded
    Examples:
      | name          | file                   |
      | Midterm Study | Midterm_Study_Data.zip |

     # Alternate Flow
  Scenario Outline: The administrative user deletes a channel successfully without backing up the data
    Given the admin is in the channel they want to delete
    When the admin clicks on the delete button
    And selects not to backup the channel <name>
    Then the channel is deleted
    And the admin receives a confirmation message <message>
    Examples:
      | name          | message                                    |
      | Midterm Study | The channel Midterm Study has been deleted |
