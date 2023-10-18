Feature: Voice chat with other students

  As a student,
  I want to be able to voice chat with other students,
  so that we can clearly communicate.

  Background:
    Given the student is logged in using their account

    # Normal Flow
  Scenario Outline: A student voice calls another student
    Given the student <caller> selected the relevant student <recipient> of the voice call
    And the student recipient of the voice call has online <status>
    When the student clicks on the 'voice call' button
    Then the student on the receiving will have the chance to accept
    And have a real time voice conversation with the caller
    Examples:
      | caller | recipient | status |
      | samif  | karimk    | online |
      | leab   | takik     | online |
    
    # Alternate Flow
  Scenario Outline: A student calls his group
    Given the student <caller> has selected the relevant group <group> recipient of the voice call
    When the student clicks on the 'voice call' button
    Then the online recipients <members> in the called group will have the chance to accept
    And have a real time group voice conversation with the caller
    Examples:
      | caller | group   | members                    |
      | samif  | group 4 | samif, karimk, leab, takik |

    # Error Flow
  Scenario Outline: A student calls an offline recipient
    Given the student <caller> has selected a student <recipient> with offline <status>  of the voice call
    When the student clicks on the 'voice call' button
    Then an error <error> will be returned to the caller
    Examples:
      | caller | recipient | status  | error                       |
      | samif  | karimk    | offline | karimk is currently offline |
    
