Feature: Upload files

  As an administrative user,
  I want to be able to share course content,
  so that users can access relevant materials.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace
    And the admin is in the desired directory
    And the supported file types are:
      | file type |
      | .pdf      |
      | .png      |
      | .jpg      |

    # Normal Flow
  Scenario Outline: The administrative user uploads a file successfully
    Given the admin initiated the upload process
    When the admin selects the file <file> to upload
    And the file type is valid
    Then the file will be uploaded successfully
    And the platform users will be able to access the file
    Examples:
      | file           |
      | assignment.pdf |
      | diagram.png    |

     # Alternate Flow: multiple files upload
  Scenario Outline: The administrative user uploads multiple files at the same time
    Given the admin is ready to upload files
    When the admin drags multiple files <files> into the dropbox at the same time
    And all the file types are valid
    Then the platform will ask the admin if they want to upload the files individually or zip them together
    And the files will be uploaded successfully following the admin instructions
    Examples:
      | files                       |
      | Assignment.pdf, diagram.png |
      | assignment_inputs.zip       |

        # Error Flow
  Scenario Outline: The administrative user fails to upload a file due to an invalid file type
    Given the admin initiated the upload process
    When the admin selects the file <file> to upload
    And this file is of an incompatible file type
    Then the file will not be uploaded
    And an error <error> will be displayed to the admin
    Examples:
      | file           | error                             |
      | diagram.svg    | .svg is not a supported file type |
      | bubblesort.gif | .gif is not a supported file type |
