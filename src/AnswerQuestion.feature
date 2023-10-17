Feature: Answer a discussion board question

  As an administrative user,
  I want to be mark a discussion board question as answered,
  so that answered questions are easily findable.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative user answers a question a marks it as answered
    Given the admin is looking at an unanswered question on the discussion board
    When the admin answers the question <question>
    And marks it as Answered <status>
    Then the question will have green checkmark next to it
    And the user who asked the question will receive an alert that the question has been answered
    Examples:
      | question                               | status   |
      | How can I use Gherkin?                 | Answered |
      | What is software engineering practice? | Answered |

      # Alternate Flow
  Scenario Outline: The administrative user marks a response from another user as a valid answer
    Given the admin is looking at an answered question on the discussion board
    When the admin determines that the provided answer to the question <question> is valid
    And marks it as Endorsed <status>
    Then the question will have green checkmark next to it
    And the user who asked the question will receive an alert that the question has been answered
    Examples:
      | question           | status   |
      | What is a backlog? | Endorsed |
      | What is SCRUM?     | Endorses |
