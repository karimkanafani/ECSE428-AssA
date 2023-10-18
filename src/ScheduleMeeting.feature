Feature: Schedule meeting

  As student,
  I want to be able to schedule meetings,
  so that we can organize our collaboration timings.

  Background:
    Given the student is logged in

    # Normal Flow
  Scenario Outline: The student schedules a meeting successfully
    Given the student is in the meeting scheduling page
    When the student provides the start time of the meeting <start> and end time of the meeting <end>
    And the dates and times are valid
    Then the meeting is created successfully
    And the student gets a link to join the meeting
    Examples:
      | start          | end            |
      | 23/10/17 14:00 | 23/10/17 16:00 |
      | 23/10/18 10:00 | 23/10/18 10:30 |

      # Alternate Flow
  Scenario Outline: The student schedules a meeting successfully and provides the list of participants
    Given the student is in the meeting scheduling page
    When the student provides the attendees <attendees>,the start time of the meeting <start> and end time of the meeting <end>
    And the dates and times are valid
    Then the meeting is created successfully
    And the student and attendees get a link to join the meeting
    Examples:
      | start          | end            | attendees   |
      | 23/10/17 14:00 | 23/10/17 16:00 | Karim, Sami |
      | 23/10/18 10:00 | 23/10/18 10:30 | Sami, Karim |

        # Error Flow
  Scenario Outline: The student fails to create a meeting due to invalid timings
    Given the student is in the meeting scheduling page
    When the student provides the start time of the meeting <start> and end time of the meeting <end>
    And the dates and times are not valid
    Then the meeting creation is aborted
    And the error <error> will be displayed to the student
    Examples:
      | start          | end            | error                                 |
      | 23/10/17 14:00 | 23/10/17 13:00 | End time needs to be after start time |
      | 23/10/18 10:00 | 23/10/17 10:30 | End date needs to be after start date |