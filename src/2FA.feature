Feature: two factor authentication for log in

  As a student,
  I want to be able to use 2FA to log in to my account,
  my account can be secure.

  Background:
    Given the user is logged in to their account

    #NormalScenario
  Scenario Outline: the student successfully activates 2-factor authentication
    Given the student <student> wants to activate 2-factor authentication
    When the student clicks on the activation button
    And the student provides the complete information
    Then the student's 2FA status <2FA status> will be updated
    And the student will need to use 2FA at every login
    Examples:
      | student | 2FA status |
      | samif   | Active     |

    #AlternativeScenario
  Scenario Outline: the student successfully deactivates 2-factor authentication
    Given the student <student> wants to activate 2-factor authentication
    When the student clicks on the deactivation button
    And the student provides their password
    Then the student's 2FA status <2FA status> will be updated
    And the student will not need to use 2FA at every login
    Examples:
      | student | 2FA status |
      | samif   | Inactive   |

    #ErrorScenario
  Scenario Outline: the student attempts to deactivates 2-factor authentication
    Given the student <student> wants to activate 2-factor authentication
    When the student clicks on the deactivation button
    And the student provides a wrong password
    Then the student's 2FA status <2FA status> will be not updated
    And an error <error> will be returned
    Examples:
      | student | 2FA status | error           |
      | samif   | Active     | Wrong password! |


