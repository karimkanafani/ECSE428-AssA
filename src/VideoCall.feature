Feature: Video call with other students

  As a student,
  I want to be able to video call with other students,
  so that we can visually collaborate.

  Background:
    Given the student is logged in using their account

  # Normal Flow
  Scenario Outline: A student video calls another student
    Given the student <caller> selected the relevant student <recipient> of the video call
    And the student recipient of the video call has an online <status>
    When the student clicks on the 'video call' button
    Then the student on the receiving will have the chance to accept
    And have a real time video and voice conversation with the caller
    Examples:
      | caller | recipient | status |
      | samif  | karimk    | online |
      | leab   | takik     | online |

    # Alternate Flow
  Scenario Outline: A student video calls his group
    Given the student <caller> has selected the relevant group <group> recipient of the video call
    When the student clicks on the 'video call' button
    Then the online recipients in the called group <members> will have the chance to accept
    And have a real time group video and voice conversation with the caller
    Examples:
      | caller | group   | members                    |
      | samif  | group 4 | samif, karimk, leab, takik |

  # Error Flow
  Scenario Outline: A student  calls an offline recipient
    Given the student <caller> has selected the recipient with offline <status> <recipient> of the call
    When the student clicks on the 'video call' button
    Then an error <error> will be returned to the caller
    Examples:
      | caller | recipient | status  | error                       |
      | samif  | karimk    | offline | karimk is currently offline |
