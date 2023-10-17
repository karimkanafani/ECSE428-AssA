Feature: Integrate third party services

  As an administrative user,
  I want to be able to integrate third party services,
  so that the workflow is centralized on the platform.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative successfully integrated a third party service
    Given the admin is on the integration page
    When the admin initiates the integration of a third party service
    And provides the necessary information <description> <name> and API credentials <key> for integration
    Then the third party service is successfully integrated
    Examples:
      | name     | description                                                                           | key          |
      | GitHub   | Allows users to commit, push pull and view repositories on this platform              | github_key   |
      | Jira     | Allows users to keep track of tasks and the backlog of their project on this platform | jira_key     |
      | Calendly | Allows users to schedule meetings on this platform                                    | calendly_key |


      # Alternate Flow
  Scenario Outline: The administrative user successfully integrated a third party service without providing a description
    Given the admin is on the integration page
    When the admin initiates the integration of a third party service
    And provides the necessary information <name> and API credentials <key> for integration
    Then the third party service is successfully integrated
    Examples:
      | name     | key          |
      | GitHub   | github_key   |
      | Jira     | jira_key     |
      | Calendly | calendly_key |

        # Error Flow
  Scenario Outline: The administrative user fails to integrate service due to incorrect credentials
    Given the admin is on the integration page
    When the admin initiates the integration of a third party service
    And provides the necessary information <name>
    And provides incorrect API credentials <key> for integration
    Then the third party service will not be integrated
    And the error <error> will be displayed to the admin
    Examples:
      | name   | key      | error                                                   |
      | GitHub | jira_key | Incorrect API key provided, could not integrate service |
      | Jira   | ""       | API credentials cannot be empty                         |