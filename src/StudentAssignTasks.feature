Feature: assigns tasks within a group

  As a student,
  I want to be able to assign tasks within a group,
  group work is organized and documented.

  Background:
    Given the student is logged in to their account
    And is part of a group

    #NormalFlow
  Scenario Outline: the student successfully assigns tasks to their group members
    Given the student <assigner> wants to assign tasks
    When they click on the name of the member <member>
    And assign a task <task>
    Then that memeber will be associated with that task
    Examples:
      | assigner | member | task          |
      | samif    | karimk | Feature files |

    #AlternativeFlow
  Scenario Outline: the student successfully assigns tasks to themselves
    Given the student <assigner> wants to assign tasks
    When they click on their own name <member>
    And assign a task <task>
    Then they will be associated with that task
    Examples:
      | assigner | member | task    |
      | karimk   | karimk | Testing |

     #ErrorFlowFlow
  Scenario Outline: the student attempts to assign tasks to users outside their group
    Given the student <assigner> wants to assign tasks
    When they click on group member outside their group <member>
    And assign a task <task>
    Then an error <error> will be returned
    And the group member will not be associated with that task
    Examples:
      | assigner | member | task       | error                             |
      | samif    | mehdia | Formatting | That member is not in your group! |




