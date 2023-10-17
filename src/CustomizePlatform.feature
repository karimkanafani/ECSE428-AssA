Feature: Customize platform

  As an administrative user,
  I want to be able to customize the platform's branding and appearance,
  so that it aligns with the institution's identity.

  Background:
    Given the admin is logged in using their administrative account
    And the admin is in the correct workspace

    # Normal Flow
  Scenario Outline: The administrative user customizes the platform using an existing theme
    Given the admin is in the platform settings
    When the admin selects a theme <theme>
    Then the platform changes appearence to match the theme <colors>
    Examples:
      | theme  | colors      |
      | Winter | White, teal |
      | Fall   | Orange, red |

     # Alternate Flow
  Scenario Outline: The administrative user customizes aspects of the platform manually
    Given the admin is in the platform settings
    When the admin clicks on the color wheel
    And selects parts of the GUI <gui> to apply the color <color>
    Then the GUI of the platform changes appearence to match the selected color <colors>
    Examples:
      | gui        | color |
      | Banner     | Red   |
      | Background | White |
