Feature: leave a group channel

  As a student,
  I want to be able to leave group a channel,
  so that I can join another group if necessary.

  Background:
    Given the student is logged in to their account

    #NormalFlow
  Scenario Outline: the student successfully leaves their group
    Given the student <student> is a part of a group <group>
    When the student clicks on the 'leave group' button
    Then the student's group status <status> will change
    And will no longer be part of the group
    Examples:
      | student | group   | status       |
      | samif   | Group 5 | Not a member |
      | karimk  | Group 5 | Member       |


    #AlternativeFlow
  Scenario Outline: the student successfully leaves their group
    Given the student <student> is a part of a group <group>
    And is the only member of the group
    When the student clicks on the 'leave group' button
    Then the student's group status <status> will change
    And will no longer be part of the group
    And the group will cease to exist
    Examples:
      | student | group    | status         |
      | samif   | Group 22 | Not applicable |


     #ErrorFlow
  Scenario Outline: the student attempts to leave a group they have not joined
    Given the student <student> is not part of a group <group>
    When the student clicks on the 'leave group' button
    Then the student's group status <status> will not change
    And an error <error> will be returned
    Examples:
      | student | group    | status       | error                           |
      | samif   | Group 99 | Not a member | You are not part of this group! |


