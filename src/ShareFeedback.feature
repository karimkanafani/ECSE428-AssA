Feature: Share feedback

  As an administrative user,
  I want to be able to share feedback with students,
  so that students can understand their results.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative user provides feedback to a student's assignment
    Given the admin selects an assignment <assignment> to provide feedback on
    When the admin provides feedback <feedback> correctly
    Then the feedback will be visible to the student near their submission
    Examples:
      | assignment   | feedback                                    |
      | Assignment A | Great Job on the backlog and feature files! |

      # Alternate Flow
  Scenario Outline: The administrative user provides feedback by selecting achieved milestone in the rubric
    Given the admin selects an assignment <assignment> to provide feedback on
    When the admin clicks on the rubric associated with the assignment
    And selects all the achieved points boxes in the rubric <rubric>
    Then the rubric will be visible to the student near their submission
    And the boxes indicate to them the refelction of their score
    Examples:
      | assignment   | rubric                                                                                                                       |
      | Assignment A | 3 All stories have users and several different types of users are included, 3 All stories indicate a normal flow story test. |

        # Error Flow
  Scenario Outline: The administrative user gives feedback that exceeds the character limit
    Given the admin selects an assignment <assignment> to provide feedback on
    When the admin provides feedback <feedback>
    And the feedback exceeds the character limit
    Then the feedback will not be published
    And the error <error> will be displayed to the admin
    Examples:
      | feedback                      | error                    |
      | You could have improved on... | Character limit exceeded |