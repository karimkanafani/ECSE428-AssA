Feature: see feedback on deliverables

  As a student,
  I want to be able to receive feedback on deliverables,
  so that I can immediately see comments.

  Background: the student has submitted a deliverable

    #NormalFlow
  Scenario Outline: a student successfully accesses feedback on their deliverable
    Given the student <student> is on the submission page
    When the student clicks on the 'view feedback' button for a deliverable <deliverable>
    And the feedback is status <status>
    Then the student will be able to view the feedback
    Examples:
      | student | deliverable  | status    |
      | samif   | assignment 9 | available |

     #ErrorFlow
  Scenario Outline: a student attempts to accesses feedback on a deliverable they have not submitted
    Given the student <student> is on the submission page
    When the student clicks on the 'view feedback' button for a deliverable <deliverable>
    And the feedback is status <status>
    Then an error <error> will be returned to the user
    Examples:
      | student | deliverable  | status         | error                                   |
      | samif   | Assignment 1 | not applicable | This assignment has not been submitted! |

    #ErrorFlow
  Scenario Outline: a student attempts to accesses feedback on a deliverable for which feedback is not ready yet
    Given the student <student> is on the submission page
    When the student clicks on the 'view feedback' button for a deliverable <deliverable>
    And the feedback is status <status>
    Then an error <error> will be returned to the user
    Examples:
      | student | deliverable   | status      | error                                            |
      | samif   | Final Project | unavailable | This assignment's feedback is not available yet! |


