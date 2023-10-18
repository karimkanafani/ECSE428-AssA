Feature: download contents from the projet service

  As a student,
  I want to be able to download materials from the platform,
  so that I can work on documents offline.

  Background:
    Given the student is logged in to their account

    #NormalFlow
  Scenario Outline: the student successfully downloads course content
    Given the student <student> wants to download course content <content> with an available status <status>
    When the student clicks on the download button
    Then the student will have a copy of the content on their local hard drive
    Examples:
      | student | content               | status     |
      | samif   | AssignmentHandout.pdf | Downloaded |

    #ErrorFlow
  Scenario Outline: the student attempts to download unavailable course content
    Given the student <student> wants to download course content <content> with an unavailable status <status>
    When the student clicks on the download button
    Then an error <error> will be returned
    Examples:
      | student | content                    | status      | error                         |
      | samif   | Assignment_10_solution.pdf | Unavailable | You cannot download this yet! |


  Scenario Outline: the student attempts to download content from another course
    Given the student <student> wants to download course content <content> from another course
    When the student clicks on the download button
    Then an error <error> will be returned
    Examples:
      | student | content   | error                            |
      | samif   | PhdThesis | You are not part of this course! |

