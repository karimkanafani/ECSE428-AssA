Feature: Create profile

  As student,
  I want to be able to create a profile with my information using my university credentials,
  so that I can access the group project collaboration service.

  Background:
    Given the student is on the correct platform

    # Normal Flow
  Scenario Outline: The student creates an account using their university ID
    Given the student selects Register
    When the student provides their name <name>, student ID <id> and a password to log in <password>
    Then the profile is created successfully
    Examples:
      | name           | id        | password     |
      | Karim Kanafani | 260960900 | soft_eng_123 |
      | Sami Ferneini  | 260895781 | soft_eng_456 |

      # Alternate Flow
  Scenario Outline: The student creates an account using their university email
    Given the student selects Register
    When the student provides their name <name>, student email <email> and a password to log in <password>
    Then the profile is created successfully
    Examples:
      | name           | email                         | password     |
      | Karim Kanafani | karim.kanafani@mail.mcgill.ca | soft_eng_123 |
      | Sami Ferneini  | sami.ferneini@mail.mcgill.ca  | soft_eng_456 |

        # Error Flow
  Scenario Outline: The student tried to create an account using incorrect credentials
    Given the student selects Register
    When the student provides their name <name>, student email <email> or id <id> and a password to log in <password>
    And either the email or id is incorrect
    Then the profile is not created
    And the error <error> will be displayed to the student
    Examples:
      | name           | email                    | password     | error                                    |
      | Karim Kanafani | karim.kanafani@gmail.com | soft_eng_123 | Email is not associated with institution |
      | Sami Ferneini  | 123                      | soft_eng_456 | ID does not fit institution ID format    |