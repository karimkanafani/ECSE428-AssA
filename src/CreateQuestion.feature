Feature: Create questions in a discussion board

  As a student,
  I want to be able to create questions in a discussion board,
  I can easily get answers.

  Background:
    Given the student has a question to ask the course administrators

    #NormalFlow
  Scenario Outline: A student successfully creates a public question
    Given the student <student> is on the disccusion board page
    When the student clicks on the 'create a public question' button with privacy status <status>
    And fills out the relevant information
    Then the question <questionTitle> will be successfully created
    And administrators and other students will be able to answer
    Examples:
      | student | questionTitle           | status |
      | samif   | Assignment4, question 1 | public |


    #AlternativeFlow
  Scenario Outline: A student successfully creates a private question
    Given the student <student> is on the disccusion board page
    When the student clicks on the 'create a private question' button with privacy status <status>
    And fills out the relevant information
    Then the question <questionTitle> will be successfully created
    And administrators will be able to answer
    Examples:
      | student | questionTitle   | status  |
      | samif   | Secret Question | private |

   #ErrorFlow
  Scenario Outline: A student unsuccessfully creates a question
    Given the student <student> is on the disccusion board page
    When the student clicks on the 'create a public question' button with privacy status <status>
    And does not fill out the relevant information
    Then an error <error> will be returned
    Examples:
      | student | status | error                        |
      | karimk  | public | The 'body' section is blank! |

