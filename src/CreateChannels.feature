Feature: Create a new channel

  As an administrative user,
  I want to be able to create channels,
  so that students can organize their communications.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative user creates a new channel with a valid name
    Given the admin selects "New channel"
    When the admin gives the new channel a non-conflicting name <name>
    Then the new channel will be created successfully
    Examples:
      | name         |
      | General Chat |
      | Assignments  |
      | Project      |
      | Office Hours |

      # Alternate Flow
  Scenario Outline: The administrative user creates a new channel with a valid name
    Given the admin uses the keyboard shortcut "CMD + N" or "CTRL + N" to create a channel
    When the admin gives the new channel a non-conflicting name <name>
    Then the new channel will be created successfully
    Examples:
      | name         |
      | General Chat |
      | Assignments  |
      | Project      |
      | Office Hours |

        # Error Flow
  Scenario Outline: The administrative user creates a new channel with an invalid name
    Given the admin selects "New channel"
    When the admin gives the new channel an invalid name <name>
    Then the new channel will not be created
    Examples:
      | name |
      | .    |
      |      |
      | _    |
      | ,    |