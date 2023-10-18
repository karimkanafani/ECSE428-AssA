Feature: signup for course notifications

  As a student,
  I want to be able to sign up for course notifications,
  so that I can know of any new information immediately.

  Background:
    Given the student is logged in to their account

    #NormalFlow
  Scenario Outline: a student successfully signs up for notifications
    Given the student <student> is on the notifications signup page
    When the student clicks on the available notifications <notifications> for his course
    Then the student's notification status <status> will be updated
    Examples:
      | student | notifications   | status |
      | samif   | New Assignments | Active |

     #ErrorFlow
  Scenario Outline: a student attempts to sign up for notifications that are already active
    Given the student <student> is on the notifications signup page
    When the student clicks on the available notifications <notifications> for his course
    Then an error <error> will be returned
    And the student's notification status <status> will be unchanged
    Examples:
      | student | notifications   | error                                              | status |
      | samif   | New Assignments | You are already signed up for these notifications! | Active |

    #ErrorFlow
  Scenario Outline: a student attempts to sign up for notifications that are for his course
    Given the student <student> is on the notifications signup page
    When the student clicks on the available notifications <notifications> for another course
    Then an error <error> will be returned
    And the student's notification status <status> will be unchanged
    Examples:
      | student | notifications   | error                            | status   |
      | samif   | New Assignments | You are not part of this course! | Inactive |


