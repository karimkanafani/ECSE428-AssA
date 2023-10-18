Feature: Access the project services platform from different devices and locations

  As a student,
  I want to be able to access and use the platform on multiple devices and browsers,
  I can work from various locations.

  Background:
    Given a student wants to access the platform from their device

  #NormalFlow
  Scenario Outline: a student successfully accesses the platform from multiple devices
    Given the student is connect to a network
    When the student <student> logs in through their device <device> using their credentials
    Then they will be granted access to the documents on the cloud
    Examples:
      | student | device    |
      | samif   | iPhone 4S |
      | samif   | iPad Air  |

    #AlternativeFlow
  Scenario Outline: a student successfully accesses the platform from multiple locations
    Given the student is connect to a network
    When the student <student> logs in through their device using their credentials from a location <location>
    Then they will be granted access to the documents on the cloud
    Examples:
      | student | location     |
      | samif   | Montreal, QC |
      | karimk  | Toronto, ON  |

    #ErrorFlow
  Scenario Outline: a student unsuccessfully accesses the platform
    Given the student is not connect to a network
    When the student <student> logs in through their device using their credentials from a location <location>
    Then an error <error> will be returned
    Examples:
      | student | location | error                                  |
      | samif   | unknown  | You are not connected to the internet! |
