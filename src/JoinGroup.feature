Feature: Join group channel

  As student,
  I want to be able to join a group channel,
  so that I can contribute to my group's work.

  Background:
    Given the student is logged in

    # Normal Flow
  Scenario Outline: The student joins a group by group number
    Given the student is in the group registration page
    When the student provides the group number of the group to join <number>
    And the group is not full
    Then the student joins the group successfully
    And the student's status <status> is set to member
    Examples:
      | number | status |
      | 77     | member |
      | 4      | member |

      # Alternate Flow
  Scenario Outline: The student joins a group at random
    Given the student is in the group registration page
    When the student chooses to join a group at random by hitting the Random button
    Then the platform will pick a group that is not full at random
    And the student joins the group <number> successfully
    And the student's status <status> is set to member
    Examples:
      | number | status |
      | 77     | member |
      | 4      | member |

        # Error Flow
  Scenario Outline: The student joins a group by group number but it is full
    Given the student is in the group registration page
    When the student provides the group number of the group to join <number>
    And the group is full
    Then the student does not join the group
    And the error <error> will be displayed to the student
    Examples:
      | number | error            |
      | 77     | Group 77 is full |
      | 4      | Group 4 is full  |