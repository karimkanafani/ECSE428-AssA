Feature: Upload and store files on the group project collaboration service.

  As a student,
  I want to be able to upload and store project-related files and resources,
  so that I can keep project materials organized.

  Background:
    Given the student is logged in their account
    And the student is in the correct workspace
    And the student is in the desired directory
    And the supported file types are:
      | file type |
      | .pdf      |
      | .png      |
      | .jpg      |

    #NormalFlow
  Scenario Outline: The student user uploads a file successfully
    Given the student initiated the upload process
    When the student selects the file <file> to upload
    And the file type is valid
    Then the file will be uploaded successfully
    And the student's group members will be able to access the file
    Examples:
      | file                    |
      | CompletedAssignment.pdf |

     # Alternate Flow: multiple files upload
  Scenario Outline: The student user uploads multiple files at the same time
    Given the student is ready to upload files
    When the student drags multiple files <files> into the dropbox at the same time
    And all the file types are valid
    Then the platform will ask the student if they want to upload the files individually or zip them together
    And the files will be uploaded successfully to be accssed by the student's group members
    Examples:
      | files                                      |
      | CompletedAssignment.pdf, EditedDiagram.png |
      | assignment_deliverables.zip                |

        # Error Flow
  Scenario Outline: The student user fails to upload a file due to an invalid file type
    Given the student initiated the upload process
    When the student selects the file <file> to upload
    And this file is of an incompatible file type
    Then the file will not be uploaded
    And an error <error> will be displayed to the admin
    Examples:
      | file           | error                             |
      | diagram.svg    | .svg is not a supported file type |
      | bubblesort.gif | .gif is not a supported file type |