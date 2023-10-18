Feature: Share and simultaneously edit documents with other students

  As a student,
  I want to be able to share and simultaneously edit documents with other students,
  so that we can work jointly on documents.

  Background:
    Given the student is logged in with their account
    And the student is the owner of a document uploaded on the server

    #Normal Flow
  Scenario Outline: A student wants to share a document with another student in their group to work together
    Given the student <sharer> has a document <document> they want to share open
    When the student <sharer> click on the 'share' button
    And selects a student <receiver> that is a member of their group with status <status>
    Then the student <sharer> and student <receiver> will be able to simultaneously edit the shared document <document>
    Examples:
      | sharer | document   | receiver | status   |
      | samif  | Essay.docx | karimk   | in-group |

    #Alternative Flow
  Scenario Outline: A student wants to share a non-editable document with another student in their group
    Given the student <sharer> has a document <document> they want to share open
    When the student <sharer> clicks on the 'share' button
    And selects a student <receiver> that is a member of their group with status <status>
    Then the student <sharer> and student <receiver> will be able to access the shared document <document>
    Examples:
      | sharer | document  | receiver | status   |
      | samif  | Essay.pdf | karimk   | in-group |

    #ErrorFlow
  Scenario Outline: A student wants to share a  document with a student not in their group
    Given the student <sharer> has a document <document> they want to share open
    When the student <sharer> clicks on the 'share' button
    And selects a student <receiver> that is not a member of their group with status <status>
    Then an error <error> is returned to the student <sharer>
    Examples:
      | sharer | document   | receiver | status       | error                      |
      | samif  | Essay.docx | leab     | not-in-group | student is not your group! |
