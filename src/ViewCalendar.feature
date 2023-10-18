Feature: view calendar related to course

  As a student,
  I want to be able to view a calendar of project deadlines and milestones,
  so that I can stay on top of my tasks.

  Background:
    Given a student is logged in to their account

    #NormalFlow
  Scenario Outline: the student successfully views their weekly activities
    Given the student <student> opens their calendar page
    When they select a given week <week>
    Then they will be able to view the deadlines <deadlines> related to that week
    Examples:
      | student | week | deadlines                   |
      | samif   | 5    | Assignment 3, Paper, Quiz 2 |

    #AlternativeFlow
  Scenario Outline: the student successfully views their daily activities
    Given the student <student> opens their calendar page
    When they select a given day <day>
    Then they will be able to view the deadlines <deadlines> related to that day
    Examples:
      | student | day        | deadlines        |
      | samif   | 03/09/2023 | Group formations |

    #ErrorFlow
  Scenario Outline: the student selects a timing outside of the course duration
    Given the student <student> opens their calendar page
    When they select a given week <week> past the course end date
    Then an error <error> will be returned
    Examples:
      | student | week | error                     |
      | samif   | 200  | That week does not exist! |



