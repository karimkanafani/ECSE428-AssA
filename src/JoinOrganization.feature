Feature: Join organization

  As student,
  I want to be able to search for and join my organization,
  so that I can access the course documentation.

  Background:
    Given the student is logged in

    # Normal Flow
  Scenario Outline: The student searches for an organization by name
    Given the student is in the organization search page
    When the student provides the name of the organization to join <name>
    And he is a member of the institution <institution> of which the organization belongs to
    Then the student joins the organization successfully
    And the student's status <status> is set to member
    Examples:
      | name                          | institution       | status |
      | Software Engineering Practice | McGill University | member |
      | Software Validation           | McGill University | member |

      # Alternate Flow
  Scenario Outline: The student searches for an organization by ID
    Given the student is in the organization search page
    When the student provides the id of the organization to join <id>
    And he is a member of the institution <institution> of which the organization belongs to
    Then the student joins the organization successfully
    And the student's status <status> is set to member
    Examples:
      | id      | institution       | status |
      | ECSE428 | McGill University | member |
      | ECSE429 | McGill University | member |

        # Error Flow
  Scenario Outline: The student tries to join an organization that does not exist
    Given the student is in the organization search page
    When the student provides the name of the organization to join <name>
    And the name does not match any registered organization on the platform
    Then the student fails to join an organization
    And the error <error> will be displayed to the student
    Examples:
      | name                 | error                                       |
      | Sleeping In Software | Name is not associated with an organization |
      | Making NFTs          | Name is not associated with an organization |