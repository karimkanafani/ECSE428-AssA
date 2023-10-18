Feature: student searches for content or users on the platform

  As a student,
  I want to be able to search for specific content or users within the platform,
  I can find information I need quickly.

  Background:
    Given the student is logged in to their account

    #NormalFlow
  Scenario Outline: a student successfully searches for a document on the platform
    Given the student <student> wants to search for a specific document <searched document>
    When the student populates the search box with their search <searched document> and clicks on the 'search' button
    Then the relevant document <displayed document> will be displayed
    Examples:
      | student | searched document | displayed document |
      | samif   | Handout_51.pdf    | Handout_51.pdf     |

    #AlternativeFlow
  Scenario Outline: a student successfully searches for a user on the platform
    Given the student <student> wants to search for a specific student <searched student>
    When the student populates the search box with their search <searched student> and clicks on the 'search' button
    Then the relevant student <displayed student> will be displayed
    Examples:
      | student | searched student | displayed student |
      | samif   | karimk           | karimk            |

    #ErrorFlow
  Scenario Outline: a student searches for a non-existent subject on the platform
    Given the student <student> wants to search for specific content <searched content> that does not exist
    When the student populates the search box with their search <searched content> and clicks on the 'search' button
    Then an error <error> will be returned
    Examples:
      | student | searched content | error                   |
      | samif   | CakeRecipe.pdf   | Content does not exist! |


