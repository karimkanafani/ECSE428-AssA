Feature: Provide feedback and evaluate group members

  As a student,
  I want to be able to provide feedback and evaluate my group members,
  we can assess each-other's contributions.

  Background:
    Given the student is loggged in to their account

    #NormalFlow
  Scenario Outline: a student wants to submit feedback on a group member
    Given the student <student> is on the feedback page
    When the student clicks on the name of the group member they wish to give feedback for <rated student>
    Then the student will be able to answer a series of questions set by the administrators
    And submit them when they are done and change their status <status>
    Examples:
      | student | rated student | status     |
      | samif   | karimk        | completed  |
      | samif   | anthonyb      | incomplete |

    #ErrorFlow
  Scenario Outline: a student wants to submit feedback on a group member already evaluated
    Given the student <student> is on the feedback page
    When the student clicks on the name of the group member <rated student> already evaluated
    Then an error <error> will be returned
    Examples:
      | student | rated student | error                                         |
      | samif   | karimk        | You have already evaluated this group member! |

    #ErrorFlow
  Scenario Outline: a student wants to submit feedback on a member outside of their group
    Given the student <student> is on the feedback page
    When the student clicks on the name of the group member <rated student> outside of their group
    Then an error <error> will be returned
    Examples:
      | student | rated student | error                         |
      | samif   | mehdia        | Student is not in your group! |



