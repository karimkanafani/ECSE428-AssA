Feature: Manage assignments

  As an administrative user,
  I want to be able to create assignments and set their deadlines,
  so that course deliverables are clear and accessible.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative user creates an assignment successfully
    Given the admin initiated the assignment creation process
    When the admin provides the assignment name <name>, a description <description>, start date <start> and end date <end>
    Then the new assignment will be created
    And will be available to all users under the assignment tab
    Examples:
      | name         | description      | start            | end             |
      | Assignment A | Create a backlog | October 1st 2023 | October 17 2023 |

      # Alternate Flow
  Scenario Outline: The administrative user creates an assignment successfully by providing a file attachment
    Given the admin initiated the assignment creation process
    When the admin provides the assignment name <name>, an instruction file <file>, start date <start> and end date <end>
    Then the new assignment will be created
    And will be available to all users under the assignment tab
    Examples:
      | name         | file            | start            | end             |
      | Assignment A | AssignmentA.pdf | October 1st 2023 | October 17 2023 |

        # Error Flow
  Scenario Outline: he administrative user fails to create an assignment due to an invalid end date
    Given the admin initiated the assignment creation process
    When the admin provides the assignment name <name>, a description <description>, start date <start> and end date <end>
    And the end date is invalid
    Then the new assignment will not be created
    And the error <error> will be displayed to the admin
    Examples:
      | name         | description      | start            | end             | error                               |
      | Assignment A | Create a backlog | October 1st 2023 | October 17 2022 | End date has to be after start date |