Feature: View submissions

  As an administrative user,
  I want to be able to view student submissions,
  so that I can review and assess them.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative views a student submission
    Given the admin is on the submissions page
    When the admin selects a student submission
    Then the selected student's submission files <files> are displayed
    And the admin can review and assess them <feedback>
    Examples:
      | files                                                      | feedback   |
      | Karim_Sami_AssA_backlog, Karim_Sami_AssA_feature_files.zip | Great job! |


      # Alternate Flow
  Scenario Outline: The administrative user downloads student's submissions for offline view
    Given the admin is on the submissions page
    When the admin selects a student submission
    And clicks on the download button
    Then the selected student's submission files <files> are downloaded
    Examples:
      | files                          |
      | Karim_Sami_AssA_submission.zip |

        # Error Flow
  Scenario Outline: The administrative user selects the wrong file from the list of submitted files
    Given the admin is on the submissions page
    When the admin selects a student
    And is given a list of submissions the student has made
    And the admin wants to view Assignment B but clicks on Assignment A
    Then the platform will display Assignment A
    And display a note <note> that this submission has already been assessed
    Examples:
      | note                                                                 |
      | File displayed has already been assessed on the 18th of October 2023 |