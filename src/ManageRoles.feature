Feature: Manage account roles and permissions

  As an administrative user,
  I want to be able to manage account roles and permissions,
  so that I can restrict access to channels.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace
    And the following roles exist:
      | role          |
      | Student       |
      | TA            |
      | Prof          |
      | Group #number |

    # Normal Flow
  Scenario Outline: The administrative user assigns a role to a user
    Given the admin selects a user
    When the admin gives user a role <role>
    Then the user will now have access to the <channels> visible to <role>
    Examples:
      | role    | channels                                         |
      | Student | General Chat, Assignments, Project, Office Hours |
      | TA      | General Chat, Office Hour, TA chat               |
      | Prof    | Announcements                                    |

     # Alternate Flow: example of student that changes groups
  Scenario Outline: The administrative user removes a role from a user
    Given the admin selects the user whose role needs to be removed
    When the admin gives removes the role <role>
    Then the user will now lose access to the <channels> visible to <role>
    Examples:
      | role     | channels      |
      | Group 3  | Group 3 chat  |
      | Group 77 | Group 77 chat |

        # Error Flow
  Scenario Outline: The administrative user adds a user role that does not exist
    Given the admin selects the user
    When the admin gives assigns the role <role>
    Then the program will not provide the role
    And will return an error message <error>
    Examples:
      | role    | error               |
      | TO      | Role does not exist |
      | Stydent | Role does not exist |
      | Pof     | Role does not exist |
