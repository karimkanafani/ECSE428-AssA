Feature: submit documents

  As a student,
  I want to be able to submit documents in a designated tab,
  so that I can hand in deliverables digitally.

  Background:
    Given a student is ready to submit a deliverable
    And is logged in to their account

    #NormalFlow
  Scenario Outline: A student successfully submits a deliverable
    Given the student is on the appropriate submission <submission> page
    When the student <student> uploads the relevant document <document>
    And clicks on the 'submit' button
    Then the submitted documents will be available for grading
    Examples:
      | submission   | student | document  |
      | Assignment 2 | samif   | essay.pdf |

    #AlternativeFlow
  Scenario Outline: A student successfully submits a several document deliverable
    Given the student is on the appropriate submission <submission> page
    When the student <student> uploads the relevant documents <document>
    And clicks on the 'submit' button
    Then the submitted documents will be available for grading in a zip format
    Examples:
      | submission   | student | document        |
      | Assignment 5 | samif   | assignment5.zip |

    #ErrorFlow
  Scenario Outline: A student submits a document deliverable after the deadline has passed
    Given the student is on the appropriate submission <submission> page
    When the student <student> uploads the relevant documents <document>
    And clicks on the 'submit' button
    And the deadline to submit the deliverable has passed
    Then an error <error> will be returned to the student
    Examples:
      | submission     | student | document    | error                                        |
      | Online Midterm | karimk  | midterm.pdf | The deadline for this submission has passed! |


