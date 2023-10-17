Feature: Voice chat with other students

  As a student,
  I want to be able to voice chat with other students,
  so that we can clearly communicate.

  Background:
    Given the student is logged in using their account

    # Normal Flow
  Scenario Outline: A student voice calls another student
    Given the student selected the relevant student recipient of the voice call
    And the student recipient of the voice call is online and available
    When the student clicks on the 'voice call' button
    Then the student on the receiving will have the chance to accept
    And have a real time voice conversation with the caller
    
    # Alternate Flow
  Scenario Outline: A student calls his group
    Given the student has selected the relevant group recipient of the voice call
    When the student clicks on the 'voice call' button
    Then the online recipients in the called group will have the chance to accept
    And have a real time group voice conversation with the caller

    # Error Flow
  Scenario Outline: A student calls an offline recipient
    Given the student has selected the offline recipient of the voice call
    When the student clicks on the 'voice call' button
    Then an error 'Student is offline' will be returned to the caller
    
