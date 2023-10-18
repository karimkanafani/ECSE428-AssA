Feature: Private messages between students

  As a student,
  I want to be able to privately message other students in my group,
  so that we keep the general chat relevant group interests.

  Background:
    Given the student is logged in using their account

  #Normal Flow
  Scenario Outline: A student privately messages text to another student in their group
    Given the student has selected another student within the same group with status <status>
    When the student <sender> clicks on the 'direct message' button
    Then the student sender <sender> will be able to direclty send a message <message> to the intended student <receiver>
    Examples:
      | sender | receiver | status   | message          |
      | samif  | karimk   | in-group | hi, how are you? |

  #AlternativeFlow
  Scenario Outline: A student privately messages an image to another student in their group
    Given the student has selected another student within the same group with status <status>
    When the student <sender> click on the 'direct message' button
    Then the student sender <sender> will be able to direclty send an image <message> to the intended student <receiver>
    Examples:
      | sender | receiver | status   | message       |
      | samif  | karimk   | in-group | funnymeme.jpg |

    #ErrorFlow
  Scenario Outline: A student privately message a student not a part of their group
    Given the student has selected another student <receiver> not in the same group with group status <status>
    When the student <sender> click on the 'direct message' button
    Then an error <error> will be returned to the student <sender>
    Examples:
      | sender | receiver | status       | error                      |
      | samif  | leab     | out-of-group | student not in your group! |